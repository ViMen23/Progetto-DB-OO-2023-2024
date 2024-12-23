package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * Questa classe rappresenta un pannello che contiene una barra dei menu
 * e un pannello figlio dinamico. La barra dei menu offre diverse funzionalità di navigazione
 * e gestione dei contenuti dell'applicazione.
 */
public class MenuBarPanel
				extends  JPanel
{

	public MenuBarPanel(JPanel panel)
	{
		JPanel menuPanel;
		JButton button;
		JMenuBar menuBar;
		JMenu menu;
		JMenuItem menuItem;

		MigLayout migLayout;

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_EXT_GAP_0_INT_GAP_10_LAYOUT_CONSTRAINT
		);


		this.setLayout(migLayout);

		migLayout = new MigLayout(
						null,
						GuiConfiguration.FOUR_CELL_EXT_GAP_2P_INT_GAP_5P_5P_3P_LAYOUT_CONSTRAINT,
						null
		);

		menuPanel = new JPanel(migLayout);
		menuPanel.setBackground(Color.white);
		this.add(menuPanel);
		/*------------------------------------------------------------------------------------------------------*/

		button = new JButton(GuiConfiguration.HOME_ICON);
		button.setCursor(GuiConfiguration.HAND_CURSOR);
		menuPanel.add(button);
		/*------------------------------------------------------------------------------------------------------*/

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				GuiConfiguration.resetHomeFrame();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menuBar = new JMenuBar();

		migLayout = new MigLayout(
						null,
						GuiConfiguration.ONE_CELL_GAP_50_LAYOUT_CONSTRAINT,
						null
		);

		menuBar.setLayout(migLayout);
		menuPanel.add(menuBar);
		/*------------------------------------------------------------------------------------------------------*/

		menu = new JMenu(GuiConfiguration.getMessage("countries"));
		menu.setCursor(GuiConfiguration.HAND_CURSOR);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		menu.getPopupMenu().setLayout(migLayout);
		menuBar.add(menu);
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("generalResearch"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					MenuBarPanel.this.setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(MenuBarPanel.this);

					MainFrame.getMainFrameInstance().getContentPane().add(
									new MenuBarPanel(new SearchCountryPanel()),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menu = new JMenu(GuiConfiguration.getMessage("confederations"));
		menu.setCursor(GuiConfiguration.HAND_CURSOR);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		menu.getPopupMenu().setLayout(migLayout);
		menuBar.add(menu);
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("generalResearch"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					MenuBarPanel.this.setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(MenuBarPanel.this);

					MainFrame.getMainFrameInstance().getContentPane().add(
									new MenuBarPanel(new SearchConfederationPanel()),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
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

		menuItem = new JMenuItem(GuiConfiguration.getMessage("generalResearch"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					MenuBarPanel.this.setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(MenuBarPanel.this);

					MainFrame.getMainFrameInstance().getContentPane().add(
									new MenuBarPanel(new SearchCompetitionPanel()),
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

		menuItem = new JMenuItem(GuiConfiguration.getMessage("generalResearch"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					MenuBarPanel.this.setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(MenuBarPanel.this);

					MainFrame.getMainFrameInstance().getContentPane().add(
									new MenuBarPanel(new SearchTeamPanel(Controller.getInstance().isAdminConnected())),
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

		menuItem = new JMenuItem(GuiConfiguration.getMessage("generalResearch"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					MenuBarPanel.this.setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(MenuBarPanel.this);

					MainFrame.getMainFrameInstance().getContentPane().add(
									new MenuBarPanel(new SearchPlayerPanel(Controller.getInstance().isAdminConnected())),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("militancyResearch"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					MenuBarPanel.this.setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(MenuBarPanel.this);

					MainFrame.getMainFrameInstance().getContentPane().add(
									new MenuBarPanel(new MilitancyFilterPanel()),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menu = new JMenu(GuiConfiguration.getMessage("statistics"));
		menu.setCursor(GuiConfiguration.HAND_CURSOR);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		menu.getPopupMenu().setLayout(migLayout);
		menuBar.add(menu);
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("totalStatisticsResearch"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					MenuBarPanel.this.setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(MenuBarPanel.this);

					MainFrame.getMainFrameInstance().getContentPane().add(
									new MenuBarPanel(new SearchTotalStatistics()),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("competitionEditionFilter"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					MenuBarPanel.this.setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(MenuBarPanel.this);

					MainFrame.getMainFrameInstance().getContentPane().add(
									new MenuBarPanel(new CompetitionEditionFilterPanel()),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		button = new JButton(GuiConfiguration.FILTER_ICON);
		button.setCursor(GuiConfiguration.HAND_CURSOR);
		menuPanel.add(button);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					MenuBarPanel.this.setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(MenuBarPanel.this);

					MainFrame.getMainFrameInstance().getContentPane().add(
									new MenuBarPanel(new StepFilterPanel()),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		button = new JButton(GuiConfiguration.DICE_ICON);
		button.setCursor(GuiConfiguration.HAND_CURSOR);
		menuPanel.add(button);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					MenuBarPanel.this.setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(MenuBarPanel.this);

					MainFrame.getMainFrameInstance().getContentPane().add(
									new MenuBarPanel(new ViewPlayerGeneralInfo(Controller.getInstance().getRandomPlayer())),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		this.add(panel);
	}
}