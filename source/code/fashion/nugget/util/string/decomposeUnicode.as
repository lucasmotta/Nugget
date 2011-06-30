package fashion.nugget.util.string
{
	/** 
	 * Removes all special characters of a string
	 * 
	 * @param string			The original string 
	 * 
	 * @return The string without special characters (accents, symbols) 
	 */ 
	public function decomposeUnicode(string : String) : String
	{
		for (var i : int = 0; i < DecomposeUnicodeHelper.pattern.length; i++)
		{
			string = string.replace(DecomposeUnicodeHelper.pattern[i], DecomposeUnicodeHelper.patternReplace[i]);
		}
		return string;
	}
}
