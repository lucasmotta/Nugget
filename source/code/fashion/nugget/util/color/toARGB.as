package fashion.nugget.util.color
{
	/**
	 * Transform a RGB color to ARGB
	 * 
	 * @param color							Color
	 * @param alpha							Alpha (values between 0 and 1)
	 */
	public function toARGB(color : uint, alpha : Number = 1) : uint
	{
		return (((alpha * 255) * 0xff) << 24) + color;
	}
}
