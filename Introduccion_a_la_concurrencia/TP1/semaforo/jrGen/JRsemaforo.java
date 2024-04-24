/*****************************************************
 * jr generated file
 ****************************************************/
import edu.ucdavis.jr.*;
import edu.ucdavis.jr.jrx.*;
import java.rmi.*;
import java.io.Serializable;

    public class JRsemaforo
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

	public Cap_ext_ op_Consumidor_voidTovoid;
	public Cap_ext_ JRget_op_Consumidor_voidTovoid() {
		return op_Consumidor_voidTovoid;
	}
	public void JRset_op_Consumidor_voidTovoid(Cap_ext_ op_Consumidor_voidTovoid) {
		this.op_Consumidor_voidTovoid = op_Consumidor_voidTovoid;
	}

	public Cap_ext_ op_productor_voidTovoid;
	public Cap_ext_ JRget_op_productor_voidTovoid() {
		return op_productor_voidTovoid;
	}
	public void JRset_op_productor_voidTovoid(Cap_ext_ op_productor_voidTovoid) {
		this.op_productor_voidTovoid = op_productor_voidTovoid;
	}

	public Cap_ext_ op_go_voidTovoid;
	public Cap_ext_ JRget_op_go_voidTovoid() {
		return op_go_voidTovoid;
	}
	public void JRset_op_go_voidTovoid(Cap_ext_ op_go_voidTovoid) {
		this.op_go_voidTovoid = op_go_voidTovoid;
	}

	public Cap_ext_ op_mutex_voidTovoid;
	public Cap_ext_ JRget_op_mutex_voidTovoid() {
		return op_mutex_voidTovoid;
	}
	public void JRset_op_mutex_voidTovoid(Cap_ext_ op_mutex_voidTovoid) {
		this.op_mutex_voidTovoid = op_mutex_voidTovoid;
	}

	public JRsemaforo(JRsemaforo copy)
	{
	this.op_done_voidTovoid = copy.op_done_voidTovoid;
	this.op_Consumidor_voidTovoid = copy.op_Consumidor_voidTovoid;
	this.op_productor_voidTovoid = copy.op_productor_voidTovoid;
	this.op_go_voidTovoid = copy.op_go_voidTovoid;
	this.op_mutex_voidTovoid = copy.op_mutex_voidTovoid;

	}
	public JRsemaforo(Object ... opSig)
	{
	this.op_done_voidTovoid = new Cap_ext_((Op_ext_.JRProxyOp)opSig[0]);
	this.op_Consumidor_voidTovoid = new Cap_ext_((Op_ext_.JRProxyOp)opSig[1]);
	this.op_productor_voidTovoid = new Cap_ext_((Op_ext_.JRProxyOp)opSig[2]);
	this.op_go_voidTovoid = new Cap_ext_((Op_ext_.JRProxyOp)opSig[3]);
	this.op_mutex_voidTovoid = new Cap_ext_((Op_ext_.JRProxyOp)opSig[4]);

	}
	public JRsemaforo(boolean dummy)	{
	    super(dummy);
	this.op_done_voidTovoid = Cap_ext_.noop;
	this.op_Consumidor_voidTovoid = Cap_ext_.noop;
	this.op_productor_voidTovoid = Cap_ext_.noop;
	this.op_go_voidTovoid = Cap_ext_.noop;
	this.op_mutex_voidTovoid = Cap_ext_.noop;

	}
	public Object clone()
	    throws CloneNotSupportedException
	{
	    return super.clone();
	}
	public static Object getNoop()
	{
	    return new JRsemaforo(true);
	}
    }
