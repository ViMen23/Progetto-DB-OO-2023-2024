package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class AdminNavigationPanel
				extends  JPanel
{

	public AdminNavigationPanel(JPanel panel)
	{
		MigLayout migLayout;
		JPanel navigationPanel;
		TitleLabel titleLabel;
		JButton button;

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.TWO_CELL_EXT_GAP_0_INT_GAP_10_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);


		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		navigationPanel = new JPanel(migLayout);

		this.add(navigationPanel);
		/*------------------------------------------------------------------------------------------------------*/



		titleLabel = new TitleLabel(GuiConfiguration.getMessage("adminView"));
		navigationPanel.add(titleLabel, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		JLabel label = new JLabel();
		navigationPanel.add(label);

		button = new JButton("MODIFICA COMPETIZIONE EDIZIONE");
		button.setCursor(GuiConfiguration.HAND_CURSOR);


		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();

				AdminNavigationPanel.this.setVisible(false);

				container.remove(AdminNavigationPanel.this);

				container.add(new AdminNavigationPanel(new AdminSearchCompetition()), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
			}
		});

		navigationPanel.add(button);

		button = new JButton(GuiConfiguration.getMessage("addTeam"));
		button.setCursor(GuiConfiguration.HAND_CURSOR);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();

				AdminNavigationPanel.this.setVisible(false);

				container.remove(AdminNavigationPanel.this);

				container.add(new AdminNavigationPanel(new CreateTeam()), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
			}
		});

		navigationPanel.add(button);
		/*------------------------------------------------------------------------------------------------------*/


		button = new JButton(GuiConfiguration.getMessage("editTeam"));
		button.setCursor(GuiConfiguration.HAND_CURSOR);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();

				AdminNavigationPanel.this.setVisible(false);

				container.remove(AdminNavigationPanel.this);

				container.add(new AdminNavigationPanel(new SearchTeamPanel(Controller.getInstance().isAdminConnected())), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
			}
		});

		navigationPanel.add(button);
		/*------------------------------------------------------------------------------------------------------*/

		button = new JButton(GuiConfiguration.getMessage("addPlayer"));
		button.setCursor(GuiConfiguration.HAND_CURSOR);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();

				AdminNavigationPanel.this.setVisible(false);

				container.remove(AdminNavigationPanel.this);

				container.add(new AdminNavigationPanel(new CreatePlayer()), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
			}
		});

		navigationPanel.add(button);
		/*------------------------------------------------------------------------------------------------------*/


		button = new JButton(GuiConfiguration.getMessage("editPlayer"));
		button.setCursor(GuiConfiguration.HAND_CURSOR);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
//				Container container = MainFrame.getMainFrameInstance().getContentPane();
//
//				if (container.getComponentCount() < 3) {
//					//container.add(new AdminSearchPlayer(), GuiConfiguration.HGROUP_FRAME_TGAP_20_ADD_CONSTRAINT);
//					return;
//				}
//
//				Component component = container.getComponent(container.getComponentCount() - 1);
//
//				component.setVisible(false);
//				container.remove(component);
//
//				//container.add(new AdminSearchPlayer(), GuiConfiguration.HGROUP_FRAME_TGAP_20_ADD_CONSTRAINT);
			}
		});

		navigationPanel.add(button);
		/*------------------------------------------------------------------------------------------------------*/


		this.add(panel);
	}
}