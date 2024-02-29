package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class TopSearchPanel
				extends JPanel
{
	public TopSearchPanel(String bottone1, String bottone2, JPanel root, JPanel toRemove)
	{
		MigLayout migLayout;
		migLayout = new MigLayout(
						"debug",
						"10[grow, fill]50[fill]10",
						"[]"
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);

		JButton button;

		button = new JButton(bottone1);
		button.setHorizontalTextPosition(SwingConstants.LEADING);
		button.setIcon(GuiConfiguration.getMaximizeIcon());
		button.setIconTextGap(40);
		button.setCursor(GuiConfiguration.getButtonCursor());
		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				if (toRemove.isShowing()) {
					root.remove(toRemove);
					//button.setIcon(minimizeIcon);
				} else {
					root.add(toRemove);
					//button.setIcon(maximizeIcon);
				}

				root.revalidate();
			}
		});

		this.add(button);


		button = new JButton(GuiConfiguration.getResetIcon());
		button.setCursor(GuiConfiguration.getButtonCursor());

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				Container container = MainFrame.getMainFrameInstance().getContentPane();
				Component component = container.getComponent(2);
				component.setVisible(false);
				container.remove(component);

				try {
					Component newComponent = component.getClass().getDeclaredConstructor().newInstance();
					container.add(newComponent, "sgx frame, growy");
					newComponent.setVisible(true);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}

			}
		});

		this.add(button);
	}
}
