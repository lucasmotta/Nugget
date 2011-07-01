package fashion.nugget.motion
{

	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	import com.greensock.easing.Expo;

	/**
	 * @author	Grifo.tv / Danilo Figueiredo - http://www.grifo.tv
	 * 			Lucas Motta - http://lucasmotta.com
	 * 			
	 * You can check it out more information about the sleek tween on the original post, made by Danilo: http://goo.gl/oGcge
	 * I just implemented Danilo's version to the TweenMax/TweenLite engine, using TimelineLite and TweenLite.
	 * It doesn't work for properties that's not a number.
	 */
	public class SleekTween
	{

		// ----------------------------------------------------
		// PUBLIC STATIC CONSTANTS
		// ----------------------------------------------------
		private static const DIVISOR : Number = 0.5714285714285714;

		// The constant FIRST_HALF and SECOND_HALF should be equal to 1
		private static const FIRST_HALF : Number = 0.21053;

		private static const SECOND_HALF : Number = 0.78947;


		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function SleekTween()
		{
			throw new Error("SleekTween is a static class and should not be instantiated.");
		}

		// ----------------------------------------------------
		// PUBLIC STATIC METHODS
		// ----------------------------------------------------
		public static function to(target : Object, time : Number, vars : Object) : TimelineLite
		{
			var timelineParameters : Object = {};
			var tweenParameters : Object = {};
			for (var prop : String in vars)
			{
				if (typeof vars[prop] != "number")
				{
					timelineParameters[prop] = vars[prop];
				}
				else if (typeof vars[prop] == "number" && prop != "delay")
				{
					tweenParameters[prop] = vars[prop];
				}
			}
			var timeline : TimelineLite = new TimelineLite(vars.hasOwnProperty("delay") ? { delay:vars["delay"] } : null);
			timeline.vars["onComplete"] = setTween;
			timeline.vars["onCompleteParams"] = [timeline, timelineParameters, target, time, tweenParameters];
			return timeline;
		}

		// ----------------------------------------------------
		// PRIVATE STATIC METHODS
		// ----------------------------------------------------
		private static function setTween(timeline : TimelineLite = null, timelineParameters : Object = null, target : Object = null, time : Number = undefined, vars : Object = null) : void
		{
			if (timeline == null) return;
			var firstTweenParameters : Object = {};
			var secondTweenParameters : Object = {};
			var prop : String;

			for (prop in vars)
			{
				firstTweenParameters[prop] = (vars[prop] - target[prop]) * DIVISOR + target[prop];
				secondTweenParameters[prop] = vars[prop];
			}
			firstTweenParameters["ease"] = Expo.easeIn;
			secondTweenParameters["ease"] = Expo.easeOut;
			if(timelineParameters["onUpdate"])
			{
				firstTweenParameters["onUpdate"] = timelineParameters["onUpdate"];
				secondTweenParameters["onUpdate"] = timelineParameters["onUpdate"];
			}

			// Set the timeline
			timeline.stop();
			timeline.vars["onComlete"] = undefined;
			timeline.vars["onCompleteParams"] = undefined;
			for (prop in timelineParameters)
			{
				timeline.vars[prop] = timelineParameters[prop];
			}
			timeline.append(new TweenLite(target, time * FIRST_HALF, firstTweenParameters));
			timeline.append(new TweenLite(target, time * SECOND_HALF, secondTweenParameters));
			timeline.play();
		}
	}
}