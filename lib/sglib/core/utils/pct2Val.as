package sglib.core.utils
{
	/**
	 * ...
	 * @author thienhaflash
	 */
	public function pct2Val(st: Number, ed: Number, pct: Number, validate: Boolean = false, precise : Number = 0.001): Number 
	{
		if (validate) pct = (pct < 0) ? 0 : (pct > 1) ? 1 : pct;
		
		var val : Number =  pct * (ed - st) + st;
		
		if (Math.abs(ed - val) < precise) val = ed;
		
		return val;
	}
}