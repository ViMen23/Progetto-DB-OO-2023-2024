package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class TopSearchPanel
				extends JPanel
{
	private static final ImageIcon RESET = GuiConfiguration.createImageIcon("images/reset.png");
	private static final ImageIcon MINIMIZE = GuiConfiguration.createImageIcon("images/minimize.png");
	private static final ImageIcon MAXIMIZE = GuiConfiguration.createImageIcon("images/maximize.png");

	private final JButton titleButton;

	public TopSearchPanel(String titleButtonString,
												JPanel rootPanel,
												JPanel toRemovePanel)
	{

		this(titleButtonString, rootPanel);

		titleButton.setEnabled(true);
		titleButton.setIcon(MAXIMIZE);
		titleButton.setIconTextGap(40);
		titleButton.setCursor(GuiConfiguration.HAND_CURSOR);

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

	public TopSearchPanel(String titleButtonString, JPanel rootPanel)
	{
		MigLayout migLayout;
		JButton resetButton;

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_EXT_GAP_0_INT_GAP_110_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);

		this.titleButton = new JButton(titleButtonString);

		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);
		titleButton.setCursor(GuiConfiguration.HAND_CURSOR);
		titleButton.setEnabled(false);

		this.add(titleButton, GuiConfiguration.WIDTH_80P_ADD_CONSTRAINT);


		resetButton = new JButton(RESET);
		resetButton.setCursor(GuiConfiguration.HAND_CURSOR);

		resetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();

				rootPanel.getParent().setVisible(false);
				container.remove(rootPanel.getParent());
				try {
					Component newComponent = rootPanel.getParent().getClass().getDeclaredConstructor(JPanel.class).newInstance(
									rootPanel.getClass().getDeclaredConstructor(Boolean.class)
													.newInstance(Controller.getInstance().isAdminConnected())
					);
					container.add(newComponent, GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
					newComponent.setVisible(true);
				} catch (Exception ex) {
					System.err.println("Errore: " + ex.getMessage());
				}
			}
		});

		this.add(resetButton);
	}


	public JButton getTitleButton()
	{
		return titleButton;
	}
}
