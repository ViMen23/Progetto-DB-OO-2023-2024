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
	private final JButton resetButton;

	public TopSearchPanel(String titleButtonString,
												JPanel rootPanel,
												JPanel toRemovePanel,
												Boolean viewAdmin)
	{

		this(titleButtonString, rootPanel, viewAdmin);

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

	public TopSearchPanel(String titleButtonString,
												JPanel rootPanel,
												Boolean viewAdmin)
	{
		MigLayout migLayout;

		migLayout = new MigLayout(
						null,
						GuiConfiguration.TWO_CELL_EXT_GAP_0_INT_GAP_110_LAYOUT_CONSTRAINT,
						null
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
				Container contentPane = MainFrame.getMainFrameInstance().getContentPane();
				try {
					Component newComponent;

					rootPanel.getParent().setVisible(false);
					contentPane.remove(rootPanel.getParent());

					if (viewAdmin) {
					newComponent = rootPanel.getParent().getClass().getDeclaredConstructor(JPanel.class).newInstance(
									rootPanel.getClass().getDeclaredConstructor(Boolean.class)
													.newInstance(Controller.getInstance().isAdminConnected()));
					}
					else {
						newComponent = rootPanel.getParent().getClass().getDeclaredConstructor(JPanel.class).newInstance(
										rootPanel.getClass().getDeclaredConstructor().newInstance());
					}

					contentPane.add(newComponent, GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
				} catch (Exception ex) {
					System.err.println("Errore: " + ex.getMessage());
				}
			}
		});

		this.add(resetButton);
	}

	public TopSearchPanel(String titleButtonString,
												JPanel rootPanel,
												JPanel toRemovePanel)
	{
		this(titleButtonString, rootPanel,  toRemovePanel,false);
	}


	public JButton getTitleButton()
	{
		return titleButton;
	}
	public JButton getResetButton(){ return resetButton; }
}
