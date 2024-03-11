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
		JMenuBar menuBar;
		JMenu menu;
		JMenuItem menuItem;
		JButton button;

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						GuiConfiguration.TWO_CELL_EXT_GAP_0_INT_GAP_10_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		migLayout = new MigLayout(
						GuiConfiguration.CENTER_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_FILL_SIZE_55P_INT_GAP_6P_LAYOUT_CONSTRAITN,
						null
		);

		navigationPanel = new JPanel(migLayout);
		navigationPanel.setBackground(Color.white);
		this.add(navigationPanel);
		/*------------------------------------------------------------------------------------------------------*/

		menuBar = new JMenuBar();

		migLayout = new MigLayout(
						GuiConfiguration.CENTER_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_50_LAYOUT_CONSTRAINT,
						null
		);

		menuBar.setLayout(migLayout);
		navigationPanel.add(menuBar);
		/*------------------------------------------------------------------------------------------------------*/

		menu = new JMenu(GuiConfiguration.getMessage("competitions"));
		menu.setCursor(GuiConfiguration.HAND_CURSOR);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		menu.getPopupMenu().setLayout(migLayout);
		menuBar.add(menu);
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("editCompetitionEdition"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					AdminNavigationPanel.this.setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminNavigationPanel.this);

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminSearchCompetition()),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menu = new JMenu(GuiConfiguration.getMessage("teams"));
		menu.setCursor(GuiConfiguration.HAND_CURSOR);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		menu.getPopupMenu().setLayout(migLayout);
		menuBar.add(menu);
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("addTeam"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					AdminNavigationPanel.this.setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminNavigationPanel.this);

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new CreateTeam()),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("editTeam"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					AdminNavigationPanel.this.setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminNavigationPanel.this);

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new SearchTeamPanel(Controller.getInstance().isAdminConnected())),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menu = new JMenu(GuiConfiguration.getMessage("players"));
		menu.setCursor(GuiConfiguration.HAND_CURSOR);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		menu.getPopupMenu().setLayout(migLayout);
		menuBar.add(menu);
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("addPlayer"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					AdminNavigationPanel.this.setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminNavigationPanel.this);

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new CreatePlayer()),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("editPlayer"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					AdminNavigationPanel.this.setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminNavigationPanel.this);

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new SearchPlayerPanel(Controller.getInstance().isAdminConnected())),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		button = new JButton(GuiConfiguration.filterIcon);
		button.setCursor(GuiConfiguration.HAND_CURSOR);
		navigationPanel.add(button);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					AdminNavigationPanel.this.setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminNavigationPanel.this);

//					MainFrame.getMainFrameInstance().getContentPane().add(
//									new AdminNavigationPanel(new AdminStepFilter(),
//									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
//					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		this.add(panel);
	}
}