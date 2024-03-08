package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class AdminChooseSearchCompetition
				extends JPanel
{
	public AdminChooseSearchCompetition() {
		MigLayout migLayout;
		TitleLabel titleLabel;
		JButton searchButton;
		JButton filterButton;


		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);


		this.setLayout(migLayout);
		this.setOpaque(false);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("editCompetition"));

		this.add(titleLabel, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);

		searchButton = new JButton(GuiConfiguration.getMessage("searchCompetition"));
		searchButton.setCursor(GuiConfiguration.HAND_CURSOR);

		this.add(searchButton);

		filterButton = new JButton(GuiConfiguration.getMessage("filterCompetition"));
		filterButton.setCursor(GuiConfiguration.HAND_CURSOR);

		this.add(filterButton);

		searchButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Component component = MainFrame.getMainFrameInstance().getContentPane().getComponent(2);

				component.setVisible(false);

				MainFrame.getMainFrameInstance().getContentPane().remove(component);

				MainFrame.getMainFrameInstance().add(new AdminSearchCompetition(), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
			}
		});

		filterButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Component component = MainFrame.getMainFrameInstance().getContentPane().getComponent(2);

				component.setVisible(false);

				MainFrame.getMainFrameInstance().getContentPane().remove(component);

				//MainFrame.getMainFrameInstance().add(new AdminFilterCompetition(), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
			}
		});
	}


}
