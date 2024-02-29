package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.util.regex.Pattern;

public class LabelTextPanel
				extends JPanel
{
	public LabelTextPanel(String label1Text,
												JLabel ctrlLabel1,
												Pattern pattern1,
												String label2Text,
												JLabel ctrlLabel2,
												Pattern pattern2)
	{
		MigLayout migLayout;
		JLabel label;
		JTextField textField1;
		JTextField textField2;

		migLayout = new MigLayout();

		this.setLayout(migLayout);

		label = new JLabel(label1Text);
		this.add(label);

		textField1 = new JTextField();
		this.add(textField1);
		textField1.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e) {
				if (pattern1.matcher(textField1.getText()).find()) {
					ctrlLabel1.setText(textField1.getText());
				} else {
					ctrlLabel1.setText(null);
				}
			}
		});

		label = new JLabel(label2Text);
		this.add(label);

		textField2 = new JTextField();
		this.add(textField2);
		textField2.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e) {
				if (pattern2.matcher(textField2.getText()).find()) {
					ctrlLabel2.setText(textField2.getText());
				} else {
					ctrlLabel2.setText(null);
				}
			}
		});
	}

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
			public void caretUpdate(CaretEvent e) {
				if (pattern.matcher(textField.getText()).find()) {
					ctrlLabel.setText(textField.getText());
				} else {
					ctrlLabel.setText(null);
				}
			}
		});
	}


}
