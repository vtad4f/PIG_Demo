import java.io.IOException;
import org.apache.pig.EvalFunc;
import org.apache.pig.data.DataType;
import org.apache.pig.data.Tuple;
import org.apache.pig.data.TupleFactory;

  public class CompTwoCol extends EvalFunc<Tuple>
  {
	  public Tuple exec(Tuple input) throws IOException {
	        if (input == null || input.size()<2)
	            return null;
	        try{
	            Tuple output = TupleFactory.getInstance().newTuple(1);

	            Object chapNo = input.get(0);
	            Object chapTotal = input.get(1);
	            Boolean isCommon = (DataType.toInteger(chapTotal) == DataType.toInteger(chapNo));
	            
	            output.set(0, isCommon);
	            return output;
	        } 
	        catch(Exception e){
	            System.err.println("Failed to process input; error - " + e.getMessage());
	            return null;
	        }
	    }
  }