package gui;

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
		MigLayout migLayout;

		migLayout = new MigLayout(
						GuiConfiguration.topSearchPanelLayoutConstraint,
						GuiConfiguration.topSearchPanelColumnConstraint,
						GuiConfiguration.topSearchPanelRowConstraint
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);



		this.titleButton = new JButton(titleButtonString, MAXIMIZE);

		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);
		titleButton.setIconTextGap(40);
		titleButton.setCursor(GuiConfiguration.getButtonCursor());

		titleButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				if (toRemovePanel.isShowing()) {
					rootPanel.remove(toRemovePanel);
					titleButton.setIcon(MINIMIZE);
				} else {
					rootPanel.add(toRemovePanel, GuiConfiguration.middleSearchPanelAddConstraint);
					titleButton.setIcon(MAXIMIZE);
				}

				rootPanel.revalidate();
			}
		});

		this.add(titleButton, GuiConfiguration.buttonTopSearchPanelAddConstraint);

		JButton resetButton;

		resetButton = new JButton(RESET);
		resetButton.setCursor(GuiConfiguration.getButtonCursor());

		resetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();
				Component component = container.getComponent(2);
				component.setVisible(false);
				container.remove(component);

				try {
					Component newComponent = component.getClass().getDeclaredConstructor().newInstance();
					container.add(newComponent, GuiConfiguration.generalSearchPanelAddConstraint);
					newComponent.setVisible(true);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
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
