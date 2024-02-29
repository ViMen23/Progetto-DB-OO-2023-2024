package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;

public class ChooseContinentPanel
				extends JPanel
{
	private final MyComboBox myComboBox;
	public ChooseContinentPanel(String title, JLabel controlLabel) {
		MigLayout migLayout;
		migLayout = new MigLayout(
						"debug",
						"[fill, grow][]",
						"[][]"
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);


		TitleLabel titleLabel;
		titleLabel = new TitleLabel(title);
		this.add(titleLabel, "span, wrap");


		this.myComboBox = new MyComboBox(false, controlLabel);
		this.add(myComboBox);
	}

	public MyComboBox getMyComboBox()
	{
		return myComboBox;
	}
}
