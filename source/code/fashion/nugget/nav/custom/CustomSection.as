package fashion.nugget.nav.custom
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class CustomSection
	{
		
		public var view : String;
		
		public var file : String;
		
		public var id : String;
		
		public var estimatedBytes : Number;
		
		public var isDefault : Boolean;
		
		
		public function CustomSection(viewOrFile : String, id : String, estimatedBytes : Number = undefined, isDefault : Boolean = false)
		{
			if(viewOrFile.lastIndexOf(".swf") < 0)
			{
				this.view = viewOrFile;
			}
			else
			{
				this.file = viewOrFile;
			}
			this.id = id;
			this.estimatedBytes = estimatedBytes;
			this.isDefault = isDefault;
		}
		
		public function get node() : XML
		{
			var node : XML = <section id={this.id} default={this.isDefault}></section>;
			node.appendChild(this.view != null ? <view>{view}</view> : Boolean(estimatedBytes) ? <file estimatedBytes={estimatedBytes}>{file}</file> : <file>{file}</file>);
			return node;
		}
	}
}
