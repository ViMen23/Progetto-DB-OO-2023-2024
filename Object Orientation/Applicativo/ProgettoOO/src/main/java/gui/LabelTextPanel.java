package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.awt.*;
import java.util.regex.Pattern;

public class LabelTextPanel
				extends JPanel
{

	private static final ImageIcon ERROR = GuiConfiguration.createImageIcon("images/error.png");
	private static final Border BORDER_ERROR = BorderFactory.createCompoundBorder(
					BorderFactory.createEmptyBorder(-2,0,-2,10),
					BorderFactory.createMatteBorder(0, 0,0, 30, ERROR)
	);
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
		JTextField textField;
		final Border border;


		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						rowConstraint
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);

		label = new JLabel(labelText, SwingConstants.LEADING);
		this.add(label);

		textField = new JTextField(GuiConfiguration.INPUT_COLUMN);
		this.add(textField);
		border = textField.getBorder();
		textField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e)
			{
				String text = textField.getText();

				if (pattern.matcher(text).find()) {
					ctrlLabel.setText(text);
					textField.setBorder(border);
				} else {
					ctrlLabel.setText(null);
					textField.setBorder(BorderFactory.createCompoundBorder(border, BORDER_ERROR));
				}
			}
		});
	}
}
