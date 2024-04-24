/*****************************************************
 * jr generated file
 ****************************************************/
import edu.ucdavis.jr.*;
import edu.ucdavis.jr.jrx.*;
import java.rmi.*;
import java.io.Serializable;

    public class JRTP17
      extends JRjavadotlangdotObject
      implements Serializable, Cloneable
    {
	static final long serialVersionUID = 0;
	public Cap_ext_ op_done_voidTovoid;
	public Cap_ext_ JRget_op_done_voidTovoid() {
		return op_done_voidTovoid;
	}
	public void JRset_op_done_voidTovoid(Cap_ext_ op_done_voidTovoid) {
		this.op_done_voidTovoid = op_done_voidTovoid;
	}

	public Cap_ext_ op_BuscarMaximoImpar_voidTovoid;
	public Cap_ext_ JRget_op_BuscarMaximoImpar_voidTovoid() {
		return op_BuscarMaximoImpar_voidTovoid;
	}
	public void JRset_op_BuscarMaximoImpar_voidTovoid(Cap_ext_ op_BuscarMaximoImpar_voidTovoid) {
		this.op_BuscarMaximoImpar_voidTovoid = op_BuscarMaximoImpar_voidTovoid;
	}

	public Cap_ext_ op_BuscarMaximoPar_voidTovoid;
	public Cap_ext_ JRget_op_BuscarMaximoPar_voidTovoid() {
		return op_BuscarMaximoPar_voidTovoid;
	}
	public void JRset_op_BuscarMaximoPar_voidTovoid(Cap_ext_ op_BuscarMaximoPar_voidTovoid) {
		this.op_BuscarMaximoPar_voidTovoid = op_BuscarMaximoPar_voidTovoid;
	}

	public JRTP17(JRTP17 copy)
	{
	this.op_done_voidTovoid = copy.op_done_voidTovoid;
	this.op_BuscarMaximoImpar_voidTovoid = copy.op_BuscarMaximoImpar_voidTovoid;
	this.op_BuscarMaximoPar_voidTovoid = copy.op_BuscarMaximoPar_voidTovoid;

	}
	public JRTP17(Object ... opSig)
	{
	this.op_done_voidTovoid = new Cap_ext_((Op_ext_.JRProxyOp)opSig[0]);
	this.op_BuscarMaximoImpar_voidTovoid = new Cap_ext_((Op_ext_.JRProxyOp)opSig[1]);
	this.op_BuscarMaximoPar_voidTovoid = new Cap_ext_((Op_ext_.JRProxyOp)opSig[2]);

	}
	public JRTP17(boolean dummy)	{
	    super(dummy);
	this.op_done_voidTovoid = Cap_ext_.noop;
	this.op_BuscarMaximoImpar_voidTovoid = Cap_ext_.noop;
	this.op_BuscarMaximoPar_voidTovoid = Cap_ext_.noop;

	}
	public Object clone()
	    throws CloneNotSupportedException
	{
	    return super.clone();
	}
	public static Object getNoop()
	{
	    return new JRTP17(true);
	}
    }
