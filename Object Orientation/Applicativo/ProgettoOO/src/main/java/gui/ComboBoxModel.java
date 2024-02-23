//package gui;
//
//import javax.swing.*;
//import java.lang.reflect.Array;
//import java.util.ArrayList;
//import java.util.List;
//
//public class ComboBoxModel<String>
//				extends DefaultComboBoxModel<String>
//{
//	List<List<?>> lista = new ArrayList<List<?>>();
//
//	public ComboBoxModel()
//	{
//		super();
//	}
//
//	@Override
//	public void addElement(Object anObject) {
//		List<?> listString = (List<?>) anObject;
//		lista.add(listString);
//
//		super.addElement((String)listString.getFirst());
//	}
//
//	@Override
//	public Object getSelectedItem()
//	{
//		int position = getIndexOf(super.getSelectedItem());
//
//		if(position == -1){
//			return null;
//		}
//
//		return lista.get(position);
//	}
//
//
//}
