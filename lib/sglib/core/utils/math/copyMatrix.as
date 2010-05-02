package sglib.core.utils.math
{
	import flash.geom.Matrix;
	/**
	 * ...
	 * @author thienhaflash
	 */
	public function copyMatrix(tar: Matrix, src : Matrix): void {
		tar.a = src.a;
		tar.b = src.b;
		tar.c = src.c;
		tar.d  = src.d;
		tar.tx = src.tx;
		tar.ty = src.ty;
	}

}