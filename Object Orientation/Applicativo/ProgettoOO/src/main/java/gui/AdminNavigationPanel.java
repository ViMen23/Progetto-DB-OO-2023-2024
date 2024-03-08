package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class AdminNavigationPanel
				extends  JPanel
{

	public AdminNavigationPanel()
	{
		MigLayout migLayout;
		TitleLabel titleLabel;
		JButton button;

		migLayout = new MigLayout
						(
										GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
										GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
										GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
						);

		this.setLayout(migLayout);
		this.setBackground(Color.white);
		/*------------------------------------------------------------------------------------------------------*/



		titleLabel = new TitleLabel(GuiConfiguration.getMessage("adminView"));
		this.add(titleLabel, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		button = new JButton(GuiConfiguration.getMessage("addTeam"));
		button.setCursor(GuiConfiguration.HAND_CURSOR);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();

				if (container.getComponentCount() < 3) {
					container.add(new CreateTeam(), GuiConfiguration.HGROUP_FRAME_TGAP_20_ADD_CONSTRAINT);
					return;
				}

				Component component = container.getComponent(container.getComponentCount() - 1);

				component.setVisible(false);
				container.remove(component);

				container.add(new CreateTeam(), GuiConfiguration.HGROUP_FRAME_TGAP_20_ADD_CONSTRAINT);
			}
		});

		this.add(button);
		/*------------------------------------------------------------------------------------------------------*/


		button = new JButton(GuiConfiguration.getMessage("editTeam"));
		button.setCursor(GuiConfiguration.HAND_CURSOR);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();

				if (container.getComponentCount() < 3) {
					container.add(new AdminSearchTeam(), GuiConfiguration.HGROUP_FRAME_TGAP_20_ADD_CONSTRAINT);
					return;
				}

				Component component = container.getComponent(container.getComponentCount() - 1);

				component.setVisible(false);
				container.remove(component);

				container.add(new AdminSearchTeam(), GuiConfiguration.HGROUP_FRAME_TGAP_20_ADD_CONSTRAINT);
			}
		});

		this.add(button);
		/*------------------------------------------------------------------------------------------------------*/

		button = new JButton(GuiConfiguration.getMessage("addPlayer"));
		button.setCursor(GuiConfiguration.HAND_CURSOR);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();

				if (container.getComponentCount() < 3) {
					container.add(new CreatePlayer(), GuiConfiguration.HGROUP_FRAME_TGAP_20_ADD_CONSTRAINT);
					return;
				}

				Component component = container.getComponent(container.getComponentCount() - 1);

				component.setVisible(false);
				container.remove(component);

				container.add(new CreatePlayer(), GuiConfiguration.HGROUP_FRAME_TGAP_20_ADD_CONSTRAINT);
			}
		});

		this.add(button);
		/*------------------------------------------------------------------------------------------------------*/


		button = new JButton(GuiConfiguration.getMessage("editPlayer"));
		button.setCursor(GuiConfiguration.HAND_CURSOR);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();

				if (container.getComponentCount() < 3) {
					//container.add(new AdminSearchPlayer(), GuiConfiguration.HGROUP_FRAME_TGAP_20_ADD_CONSTRAINT);
					return;
				}

				Component component = container.getComponent(container.getComponentCount() - 1);

				component.setVisible(false);
				container.remove(component);

				//container.add(new AdminSearchPlayer(), GuiConfiguration.HGROUP_FRAME_TGAP_20_ADD_CONSTRAINT);
			}
		});

		this.add(button);
		/*------------------------------------------------------------------------------------------------------*/
	}
}