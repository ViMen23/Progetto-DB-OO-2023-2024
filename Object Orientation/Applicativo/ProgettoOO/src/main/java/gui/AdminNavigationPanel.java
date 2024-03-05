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

		String string;

		migLayout = new MigLayout
						(
										"debug, wrap 3",
										"0[grow, fill]0",
										"0[]0[]0"
						);

		this.setLayout(migLayout);
		this.setBackground(Color.white);
		/*------------------------------------------------------------------------------------------------------*/



		titleLabel = new TitleLabel("VISTA ADMIN");
		this.add(titleLabel, "span");
		/*------------------------------------------------------------------------------------------------------*/

		button = new JButton(GuiConfiguration.getMessage("create") + " " + GuiConfiguration.getMessage("team").toUpperCase());
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


		button = new JButton(GuiConfiguration.getMessage("modify")+ " " + GuiConfiguration.getMessage("team").toUpperCase());
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
				MainFrame.getMainFrameInstance().add(new AdminSearchTeam(), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
			}
		});

		this.add(button);
		/*------------------------------------------------------------------------------------------------------*/


		button = new JButton(GuiConfiguration.getMessage("delete")+ " " + GuiConfiguration.getMessage("team").toUpperCase());
		button.setCursor(GuiConfiguration.HAND_CURSOR);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				//TODO
			}
		});

		this.add(button);
		/*------------------------------------------------------------------------------------------------------*/

		button = new JButton(GuiConfiguration.getMessage("create")+ " " + GuiConfiguration.getMessage("player").toUpperCase());
		button.setCursor(GuiConfiguration.HAND_CURSOR);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				//TODO
			}
		});

		this.add(button);
		/*------------------------------------------------------------------------------------------------------*/


		button = new JButton(GuiConfiguration.getMessage("modify")+ " " + GuiConfiguration.getMessage("player").toUpperCase());
		button.setCursor(GuiConfiguration.HAND_CURSOR);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				//TODO
			}
		});

		this.add(button);
		/*------------------------------------------------------------------------------------------------------*/


		button = new JButton(GuiConfiguration.getMessage("delete")+ " " + GuiConfiguration.getMessage("player").toUpperCase());
		button.setCursor(GuiConfiguration.HAND_CURSOR);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				//TODO
			}
		});

		this.add(button);
	}
}