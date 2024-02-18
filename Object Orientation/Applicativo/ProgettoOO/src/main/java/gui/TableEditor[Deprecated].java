//package gui;
//
//import javax.swing.*;
//import javax.swing.table.TableCellEditor;
//
//import java.awt.*;
//import java.awt.event.ActionEvent;
//import java.awt.event.ActionListener;
//
//
//class TableEditor
//		extends DefaultCellEditor
//			implements ActionListener
//{
//
//	protected JLabel label;
//	protected boolean isPushed;
//
//	public TableEditor() {
//
//		super(new JCheckBox());
//	}
//
//	public TableEditor(String string)
//	{
//		super(new JTextField());
//
//		JOptionPane.showMessageDialog(null, "ciao");
//	}
//
//	@Override
//	public void actionPerformed(ActionEvent e) {
//		fireEditingCanceled();
//	}
//
//	public Component getTableCellEditorComponent(JTable table, Object value,
//												 boolean isSelected, int row, int column)
//	{
//		isPushed= true;
//
//		label = (JLabel)value;
//
//		return new JLabel(label.getText());
//
//	}
//
//	public Object getCellEditorValue() {
//
//		if(isPushed)
//		{
//			JOptionPane.showMessageDialog(null, "noioniiiiiiiii");
//		}
//
//		isPushed = false;
//		return label;
//	}
//
//	public boolean stopCellEditing() {
//		isPushed = false;
//		return super.stopCellEditing();
//	}
//
//	protected void fireEditingStopped() {
//		super.fireEditingStopped();
//	}
//}
