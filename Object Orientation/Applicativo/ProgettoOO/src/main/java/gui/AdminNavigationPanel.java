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



		titleLabel = new TitleLabel("VISTA ADMIN"); //TODO
		this.add(titleLabel, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		button = new JButton(GuiConfiguration.getMessage("addTeam"));
		button.setCursor(GuiConfiguration.HAND_CURSOR);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				if (MainFrame.getMainFrameInstance().getContentPane().getComponentCount() >= 3) {
					Component component = MainFrame.getMainFrameInstance().getContentPane().getComponent(2);
					component.setVisible(false);

					MainFrame.getMainFrameInstance().getContentPane().remove(component);
				}
				MainFrame.getMainFrameInstance().add(new CreateTeam(), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
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
				if (MainFrame.getMainFrameInstance().getContentPane().getComponentCount() >= 3) {
					Component component = MainFrame.getMainFrameInstance().getContentPane().getComponent(2);
					component.setVisible(false);

					MainFrame.getMainFrameInstance().getContentPane().remove(component);
				}
				MainFrame.getMainFrameInstance().add(
								new AdminSearchTeam(),
								GuiConfiguration.HGROUP_FRAME_TGAP_20_ADD_CONSTRAINT
				);
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
				if (MainFrame.getMainFrameInstance().getContentPane().getComponentCount() >= 3) {
					Component component = MainFrame.getMainFrameInstance().getContentPane().getComponent(2);
					component.setVisible(false);

					MainFrame.getMainFrameInstance().getContentPane().remove(component);
				}
				MainFrame.getMainFrameInstance().add(new CreatePlayer(), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
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
				if (MainFrame.getMainFrameInstance().getContentPane().getComponentCount() >= 3) {
					Component component = MainFrame.getMainFrameInstance().getContentPane().getComponent(2);
					component.setVisible(false);

					MainFrame.getMainFrameInstance().getContentPane().remove(component);
				}
				//MainFrame.getMainFrameInstance().add(new AdminSearchPlayer(), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
			}
		});

		this.add(button);
		/*------------------------------------------------------------------------------------------------------*/
	}
}