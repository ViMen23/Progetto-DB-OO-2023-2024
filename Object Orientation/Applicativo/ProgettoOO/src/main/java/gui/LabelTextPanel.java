package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.util.regex.Pattern;

public class LabelTextPanel
				extends JPanel
{
	public LabelTextPanel(String labelText,
												JLabel ctrlLabel,
												Pattern pattern)
	{
		MigLayout migLayout;
		JLabel label;
		JTextField textField;


		migLayout = new MigLayout();

		this.setLayout(migLayout);

		label = new JLabel(labelText);
		this.add(label);

		textField = new JTextField();
		this.add(textField);
		textField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e)
			{
				if (pattern.matcher(textField.getText()).find()) {
					ctrlLabel.setText(textField.getText());
				} else {
					ctrlLabel.setText(null);
				}
			}
		});
	}


}
