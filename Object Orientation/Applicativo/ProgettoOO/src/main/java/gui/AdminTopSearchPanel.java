package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class AdminTopSearchPanel
				extends JPanel
{
	private static final ImageIcon MINIMIZE = GuiConfiguration.createImageIcon("images/minimize.png");
	private static final ImageIcon MAXIMIZE = GuiConfiguration.createImageIcon("images/maximize.png");

	private final JButton titleButton;

	public AdminTopSearchPanel(String titleButtonString,
														 JPanel rootPanel,
														 JPanel toRemovePanel)
	{

		MigLayout migLayout;

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);

		this.titleButton = new JButton(titleButtonString);

		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);

		titleButton.setIcon(MAXIMIZE);
		titleButton.setIconTextGap(40);
		titleButton.setCursor(GuiConfiguration.HAND_CURSOR);


		this.add(titleButton);

		titleButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				if (toRemovePanel.isShowing()) {
					rootPanel.remove(toRemovePanel);
					titleButton.setIcon(MINIMIZE);
				} else {
					rootPanel.add(toRemovePanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);
					titleButton.setIcon(MAXIMIZE);
				}

				rootPanel.revalidate();
			}
		});
	}

	public AdminTopSearchPanel(String titleButtonString) {

		MigLayout migLayout;

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);

		this.titleButton = new JButton(titleButtonString);

		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);
		titleButton.setCursor(GuiConfiguration.HAND_CURSOR);

		this.add(titleButton);
	}
	public JButton getTitleButton()
	{
		return titleButton;
	}
}
