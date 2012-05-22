/**
 * VERSION: 12.0
 * DATE: 2012-02-14
 * AS3 
 * UPDATES AND DOCS AT: http://www.greensock.com
 **/
package com.greensock.plugins {
	import com.greensock.TweenLite;
/**
 * [AS3/AS2 only] Bezier tweening allows you to tween in a non-linear way. For example, you may want to tween
 * a MovieClip's position from the origin (0,0) 500 pixels to the right (500,0) but curve downwards
 * through the middle of the tween. Simply pass as many objects in the bezier Array as you'd like, 
 * one for each "control point" (see documentation on Flash's curveTo() drawing method for more
 * about how control points work).<br /><br />
 * 
 * Keep in mind that you can bezier tween ANY properties, not just x/y. <br /><br />
 * 
 * Also, if you'd like to rotate the target in the direction of the bezier path, 
 * use the <code>orientToBezier</code> special property. In order to alter a rotation property accurately, 
 * TweenLite/Max needs 5 pieces of information: <br />
 * <ol>
 * 		<li> Position property 1 (typically <code>"x"</code>)</li>
 * 		<li> Position property 2 (typically <code>"y"</code>)</li>
 * 		<li> Rotational property (typically <code>"rotation"</code>)</li>
 * 		<li> Number of degrees to add (optional - makes it easy to orient your MovieClip properly)</li>
 * 		<li> Tolerance (default is 0.01, but increase this if the rotation seems to jitter during the tween)</li>
 * </ol><br />
 * 
 * The <code>orientToBezier</code> property should be an Array containing one Array for each set of these values. 
 * For maximum flexibility, you can pass in any number of arrays inside the container array, one 
 * for each rotational property. This can be convenient when working in 3D because you can rotate
 * on multiple axis. If you're doing a standard 2D x/y tween on a bezier, you can simply pass 
 * in a Boolean value of true and TweenLite/Max will use a typical setup, <code>[["x", "y", "rotation", 0, 0.01]]</code>. 
 * Hint: Don't forget the container Array (notice the double outer brackets)<br /><br />
 * 
 * <b>USAGE:</b><br /><br />
 * <code>
 * 		import com.greensock.TweenLite; <br />
 * 		import com.greensock.plugins.TweenPlugin; <br />
 * 		import com.greensock.plugins.BezierPlugin; <br />
 * 		TweenPlugin.activate([BezierPlugin]); //activation is permanent in the SWF, so this line only needs to be run once.<br /><br />
 * 
 * 		TweenLite.to(mc, 3, {bezier:[{x:250, y:50}, {x:500, y:0}]}); //makes my_mc travel through 250,50 and end up at 500,0. <br /><br />
 * </code>
 * 
 * <p><strong>Copyright 2008-2012, GreenSock. All rights reserved.</strong> This work is subject to the terms in <a href="http://www.greensock.com/terms_of_use.html">http://www.greensock.com/terms_of_use.html</a> or for corporate Club GreenSock members, the software agreement that was issued with the corporate membership.</p>
 * 
 * @author Jack Doyle, jack@greensock.com
 */
	public class BezierPlugin extends TweenPlugin {
		/** @private **/
		public static const API:Number = 2; //If the API/Framework for plugins changes in the future, this number helps determine compatibility
		
		/** @private **/
		protected static const _RAD2DEG:Number = 180 / Math.PI; //precalculate for speed
		
		/** @private **/
		protected var _target:Object;
		/** @private **/
		protected var _orientData:Array;
		/** @private **/
		protected var _orient:Boolean;
		/** @private used for orientToBezier projections **/
		protected var _future:Object = {}; 
		/** @private **/
		protected var _beziers:Object;
		/** @private **/
		protected var _funcLookup:Object;
		/** @private If the values should be rounded to the nearest integer, <code>_round</code> will be set to <code>true</code>. **/
		protected var _round:Boolean;
		
		/** @private **/
		public function BezierPlugin() {
			super("bezier");
			_overwriteProps.pop(); 
			_funcLookup = {};
		}
		
		/** @private **/
		override public function _onInitTween(target:Object, value:*, tween:TweenLite):Boolean {
			if (!(value is Array)) {
				return false;
			}
			_init(tween, value as Array, false);
			return true;
		}
		
		/** @private **/
		protected function _init(tween:TweenLite, beziers:Array, through:Boolean):void {
			_target = tween.target;
			var enumerables:Object = tween.vars;
			if (enumerables.orientToBezier == true) {
				_orientData = [["x", "y", "rotation", 0, 0.01]];
				_orient = true;
			} else if (enumerables.orientToBezier is Array) {
				_orientData = enumerables.orientToBezier;
				_orient = true;
			}
			var props:Object = {}, i:int, p:String, isFunc:Boolean, start:Number, killVars:Object;
			for (i = 0; i < beziers.length; i++) {
				for (p in beziers[i]) {
					isFunc = _funcLookup[p] = (_target[p] is Function);
					start = (!isFunc) ? _target[p] : _target[ ((p.indexOf("set") || !("get" + p.substr(3) in _target)) ? p : "get" + p.substr(3)) ]();
					if (props[p] == null) {
						props[p] = [start];
					}
					if (typeof(beziers[i][p]) == "number") {
						props[p].push(beziers[i][p]);
					} else {
						props[p].push(start + Number(beziers[i][p].split("=").join(""))); //relative value
					}
				}
			}
			for (p in props) {
				_overwriteProps[_overwriteProps.length] = p;
				if (enumerables[p] != null) {
					if (typeof(enumerables[p]) == "number") {
						props[p].push(enumerables[p]);
					} else {
						props[p].push(props[p][0] + Number(enumerables[p].split("=").join(""))); //relative value
					}
					killVars = {_tempKill:true};
					killVars[p] = true;
					tween._kill(killVars, _target);
					delete enumerables[p]; //in case TweenLite/Max hasn't reached the enumerable yet in its init() function. This prevents normal tweens from getting created for the properties that should be controled with the BezierPlugin.
				}
			}
			_beziers = parseBeziers(props, through);
		}
		
		/**
		 * Helper method for translating control points into bezier information.
		 * 
		 * @param props Object containing a property corresponding to each one you'd like bezier paths for. Each property's value should be a single Array with the numeric point values (i.e. <code>props.x = [12,50,80]</code> and <code>props.y = [50,97,158]</code>). 
		 * @param through If you want the paths drawn THROUGH the supplied control points, set this to true.
		 * @return A new object with an Array of values for each property. The first element in the Array is the start value, the second is the control point, and the 3rd is the end value. (i.e. <code>returnObject.x = [[12, 32, 50], [50, 65, 80]]</code>)
		 */
		public static function parseBeziers(props:Object, through:Boolean=false):Object { 
			var i:int, a:Array, b:Object, p:String;
			var all:Object = {};
			if (through) {
				for (p in props) {
					a = props[p];
					all[p] = b = [];
					if (a.length > 2) {
						b[b.length] = [a[0], a[1] - ((a[2] - a[0]) / 4), a[1]];
						for (i = 1; i < a.length - 1; i++) {
							b[b.length] = [a[i], a[i] + (a[i] - b[i - 1][1]), a[i + 1]];
						}
					} else {
						b[b.length] = [a[0], (a[0] + a[1]) / 2, a[1]];
					}
				}
			} else {
				for (p in props) {
					a = props[p];
					all[p] = b = [];
					if (a.length > 3) {
						b[b.length] = [a[0], a[1], (a[1] + a[2]) / 2];
						for (i = 2; i < a.length - 2; i += 1) {
							b[b.length] = [b[i - 2][2], a[i], (a[i] + a[i + 1]) / 2];
						}
						b[b.length] = [b[b.length - 1][2], a[a.length - 2], a[a.length - 1]];
					} else if (a.length == 3) {
						b[b.length] = [a[0], a[1], a[2]];
					} else if (a.length == 2) {
						b[b.length] = [a[0], (a[0] + a[1]) / 2, a[1]];
					}
				}
			}
			return all;
		}
		
		/** @private **/
		override public function _kill(lookup:Object):Boolean {
			for (var p:String in _beziers) {
				if (p in lookup) {
					delete _beziers[p];
					delete _funcLookup[p];
				}
			}
			return super._kill(lookup);
		}
		
		/** @private **/
		override public function _roundProps(lookup:Object, value:Boolean=true):void {
			var i:int = _overwriteProps.length;
			while (--i > -1) {
				if (("bezier" in lookup) || ("bezierThrough" in lookup) || (_overwriteProps[i] in lookup)) {
					_round = value; //TODO rework beziers so that individual properties can be rounded (or not)
				}
			}
		}
		
		/** @private **/
		override public function setRatio(v:Number):void {
			var i:int, p:String, b:Object, t:Number, segments:int, val:Number, neg:Number;
			if (v == 1) { //to make sure the end values are EXACTLY what they need to be.
				for (p in _beziers) {
					i = _beziers[p].length - 1;
					if (_funcLookup[p]) {
						_target[p](_beziers[p][i][2]);
					} else {
						_target[p] = _beziers[p][i][2];
					}
				}
			} else {
				for (p in _beziers) {
					trace(p);
					segments = _beziers[p].length;
					i = (v < 0) ? 0 : (v >= 1) ? segments - 1 : (segments * v) >> 0;
					t = (v - (i * (1 / segments))) * segments;
					b = _beziers[p][i];
					val = b[0] + t * (2 * (1 - t) * (b[1] - b[0]) + t * (b[2] - b[0]));
					if (_round) {
						val = (val > 0) ? (val + 0.5) >> 0 : (val - 0.5) >> 0;
					}
					if (_funcLookup[p]) {
						_target[p](val);
					} else {
						_target[p] = val;
					}
				}
			}
			
			
			if (_orient) {
				i = _orientData.length;
				var curVals:Object = {}, dx:Number, dy:Number, cotb:Array, toAdd:Number;
				while (i-- > 0) {
					cotb = _orientData[i]; //current orientToBezier Array
					curVals[cotb[0]] = _target[cotb[0]];
					curVals[cotb[1]] = _target[cotb[1]];
				}
				
				var oldTarget:Object = _target, oldRound:Boolean = _round;
				_target = _future;
				_round = false;
				_orient = false;
				i = _orientData.length;
				while (i-- > 0) {
					cotb = _orientData[i]; //current orientToBezier Array
					this.setRatio(v + (cotb[4] || 0.01));
					toAdd = cotb[3] || 0;
					dx = _future[cotb[0]] - curVals[cotb[0]];
					dy = _future[cotb[1]] - curVals[cotb[1]];
					if (_funcLookup[cotb[2]]) {
						oldTarget[cotb[2]]( Math.atan2(dy, dx) * _RAD2DEG + toAdd );
					} else {
						oldTarget[cotb[2]] = Math.atan2(dy, dx) * _RAD2DEG + toAdd;
					}
				}
				_target = oldTarget;
				_round = oldRound;
				_orient = true;
			}
		}
		
	}
}