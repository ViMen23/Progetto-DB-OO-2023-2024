package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.awt.*;
import java.awt.image.ImageObserver;
import java.text.AttributedCharacterIterator;
import java.util.regex.Pattern;

public class LabelTextPanel
				extends JPanel
{

	private final JTextField textField;

	public LabelTextPanel(String labelText,
												JLabel ctrlLabel,
												Pattern pattern)
	{
		this(labelText, GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT, ctrlLabel, pattern);
	}

	public LabelTextPanel(String labelText,
												String rowConstraint,
												JLabel ctrlLabel,
												Pattern pattern)
	{
		MigLayout migLayout;
		JLabel label;


		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						rowConstraint
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);

		label = new JLabel(labelText, SwingConstants.LEADING);
		this.add(label);

		textField = new JTextField(GuiConfiguration.INPUT_COLUMN);
		this.add(textField);

		textField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e)
			{
				String text = textField.getText();

				if (pattern.matcher(text).find()) {
					ctrlLabel.setText(text);
				} else {
					ctrlLabel.setText(null);
				}
			}
		});
	}

	public JTextField getTextField()
	{
		return textField;
	}
}
