package fashion.nugget.nav.custom
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class CustomDependency extends Object
	{
		
		
		public var file : String;
		
		public var id : String;
		
		public var type : String;
		
		public var estimatedBytes : Number;
		
		
		public function CustomDependency(file : String, id : String = null, type : String = null, estimatedBytes : Number = undefined)
		{
			this.file = file;
			this.id = id;
			this.type = type;
			this.estimatedBytes = estimatedBytes;
		}
		
		public function get node() : XML
		{
			var node : XML = new XML(<dependency id={this.id || this.file} type={this.type || ""} estimatedBytes={this.estimatedBytes || ""}>{this.file}</dependency>);
			return node;
		}
	}
}
