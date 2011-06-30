package fashion.nugget.util.string
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class DecomposeUnicodeHelper
	{

		/** 
		 * Helper arrays for unicode decomposition 
		 */
		public static var pattern : Array = new Array(29);
		pattern[0] = new RegExp("Š", "g");
		pattern[1] = new RegExp("Œ", "g");
		pattern[2] = new RegExp("Ž", "g");
		pattern[3] = new RegExp("š", "g");
		pattern[4] = new RegExp("œ", "g");
		pattern[5] = new RegExp("ž", "g");
		pattern[6] = new RegExp("[ÀÁÂÃÄÅ]", "g");
		pattern[7] = new RegExp("Æ", "g");
		pattern[8] = new RegExp("Ç", "g");
		pattern[9] = new RegExp("[ÈÉÊË]", "g");
		pattern[10] = new RegExp("[ÌÍÎÏ]", "g");
		pattern[11] = new RegExp("Ð", "g");
		pattern[12] = new RegExp("Ñ", "g");
		pattern[13] = new RegExp("[ÒÓÔÕÖØ]", "g");
		pattern[14] = new RegExp("[ÙÚÛÜ]", "g");
		pattern[15] = new RegExp("[ŸÝ]", "g");
		pattern[16] = new RegExp("Þ", "g");
		pattern[17] = new RegExp("ß", "g");
		pattern[18] = new RegExp("[àáâãäå]", "g");
		pattern[19] = new RegExp("æ", "g");
		pattern[20] = new RegExp("ç", "g");
		pattern[21] = new RegExp("[èéêë]", "g");
		pattern[22] = new RegExp("[ìíîï]", "g");
		pattern[23] = new RegExp("ð", "g");
		pattern[24] = new RegExp("ñ", "g");
		pattern[25] = new RegExp("[òóôõöø]", "g");
		pattern[26] = new RegExp("[ùúûü]", "g");
		pattern[27] = new RegExp("[ýÿ]", "g");
		pattern[28] = new RegExp("þ", "g");
		//
		public static var patternReplace : Array = ["S", "Oe", "Z", "s", "oe", "z", "A", "Ae", "C", "E", "I", "D", "N", "O", "U", "Y", "Th", "ss", "a", "ae", "c", "e", "i", "d", "n", "o", "u", "y", "th"];
	}
}
