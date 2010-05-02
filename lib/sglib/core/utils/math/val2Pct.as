package sglib.core.utils.math
{
	/**
	 * ...
	 * @author thienhaflash
	 */
	public function val2Pct(min: Number, max: Number, val: Number, validate: Boolean = false): Number 
	{
		var pct : Number = (val - min) / (max - min);
		if (validate) pct = (pct < 0) ? 0 : (pct>1) ? 1 : pct;
		return pct;
	}

}