package fashion.nugget.util.color
{
	/**
	 * Interpolate two colors
	 * 
	 * @param from							First color
	 * @param to							Second color
	 * @param percentage					The percent of the color transition
	 */
	public function interpolate(from : uint, to : uint, percentage : Number) : uint
	{
		var q : Number = 1 - percentage;
		var fromA : uint = (from >> 24) & 0xFF;
		var fromR : uint = (from >> 16) & 0xFF;
		var fromG : uint = (from >> 8) & 0xFF;
		var fromB : uint = from & 0xFF;
		var toA : uint = (to >> 24) & 0xFF;
		var toR : uint = (to >> 16) & 0xFF;
		var toG : uint = (to >> 8) & 0xFF;
		var toB : uint = to & 0xFF;
		var resultA : uint = fromA * q + toA * percentage;
		var resultR : uint = fromR * q + toR * percentage;
		var resultG : uint = fromG * q + toG * percentage;
		var resultB : uint = fromB * q + toB * percentage;
		var resultColor : uint = resultA << 24 | resultR << 16 | resultG << 8 | resultB;
		return resultColor;
	}
}
