package fashion.nugget.util.string
{
	/**
	 * Add html link to urls, twitter users and hashtags
	 */
	public function autoLink(value : String, window : String = "_blank") : String
	{
		// Replace links
		value = value.replace(/((?:http|https):\/\/[a-z0-9\/\?=_#&%~-]+(\.[a-z0-9\/\?=_#&%~-]+)+)|(www(\.[a-z0-9\/\?=_#&%~-]+){2,})/gi, "<a href='$&' target='" + window + "'>$&</a>");
		// Replace twitter users
		value = value.replace(/@(\w+)/, "<a href='http://www.twitter.com/$1' target='" + window + "'>@$1</a>");
		// Replace twitter hashtags
		value = value.replace(/#(\w+)/, "<a href='http://search.twitter.com/search?q=$1' target='" + window + "'>#$1</a>");
		return value;
	}
}
