package gui;

import controller.Controller;

import model.Team;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

/**
 * Questa classe rappresenta un pannello per la ricerca di statistiche totali.
 * Offre vari filtri di ricerca. I risultati della ricerca
 * vengono visualizzati in una tabella. Il pannello permette anche di
 * visualizzare informazioni di riepilogo sulla ricerca effettuata.
 * Permette di cliccare sulla tabella per ottenere maggiori informazioni sui calciatori.
 */
public class SearchTotalStatistics
				extends JPanel
{
	public SearchTotalStatistics()
	{
		final JLabel ctrlTeamType = new JLabel((String) null);
		final JLabel ctrlPlayerRole = new JLabel((String) null);

		final Integer[] tableIndex = {-1, -1};
		final JLabel ctrlMouseTable = new JLabel((String) null);

		final Vector<Vector<Object>> totalStatisticsTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> totalStatisticsTableDataMap = new HashMap<>();

		MigLayout migLayout;
		TopSearchPanel topSearchPanel;
		TitleLabel titleLabel;
		RadioPanel teamTypePanel;
		InfoPanel infoPanel;
		PlayerRoleCheckPanel playerRolePanel;
		TablePanel totalStatisticsTablePanel;
		JButton button;


		migLayout = new MigLayout(
						GuiConfiguration.VFILL_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT,
						GuiConfiguration.THREE_CELL_EXT_GAP_10_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);

		JPanel centralPanel = new JPanel();

		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_FILL_SIZE_59P_35P_INT_GAP_50_LAYOUT_CONSTRAINT,
						GuiConfiguration.FIVE_CELL_LAYOUT_CONSTRAINT
		);

		centralPanel.setLayout(migLayout);

		topSearchPanel = new TopSearchPanel(
						GuiConfiguration.getMessage("searchTotalPlayerStatistics"),
						this,
						centralPanel
		);
		this.add(topSearchPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT);

		this.add(centralPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("teamType"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		teamTypePanel = new RadioPanel(Team.TEAM_TYPE.values(), ctrlTeamType);
		centralPanel.add(teamTypePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("teamTypeInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("role"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		playerRolePanel = new PlayerRoleCheckPanel(ctrlPlayerRole);
		centralPanel.add(playerRolePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("roleInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		totalStatisticsTablePanel = new TablePanel(true, null, tableIndex, ctrlMouseTable);
		this.add(totalStatisticsTablePanel, GuiConfiguration.HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT);

		button = new JButton(GuiConfiguration.getMessage("search"));
		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				MyTable totalStatisticsTable = totalStatisticsTablePanel.getMyTable();
				String string;

				totalStatisticsTableData.clear();
				totalStatisticsTableDataMap.clear();


				Controller.getInstance().setStatisticTable(
								ctrlTeamType.getText(),
								ctrlPlayerRole.getText(),
								totalStatisticsTableData,
								totalStatisticsTableDataMap
				);


				totalStatisticsTable.setModel(
								new TableModel(totalStatisticsTableData, GuiConfiguration.STATISTIC_TOTAL_TABLE_COLUMN_NAME)
				);
				totalStatisticsTable.setPreferredScrollableViewportSize(totalStatisticsTable.getPreferredSize());

				totalStatisticsTable.getColumnModel().getColumn(2).setCellRenderer(new TableRenderer());

				// messaggio ricerca effettuata
				string = GuiConfiguration.getMessage("doneSearch");
				string += " - ";
				string += GuiConfiguration.getMessage("players");
				string += " ";
				string += totalStatisticsTableData.size();

				totalStatisticsTablePanel.getTitleLabel().setText(string);

				// messaggio informazioni ricerca effettuata
				string = "";
				if (ctrlTeamType.getText() != null) {
					string += GuiConfiguration.getMessage("teamType");
					string += ": ";
					string += GuiConfiguration.getMessage(ctrlTeamType.getText());
				}

				if (ctrlPlayerRole.getText() != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += GuiConfiguration.getMessage("role");
					string += ": ";

					String[] keyPart = ctrlPlayerRole.getText().split("_");

					string += GuiConfiguration.getMessage(keyPart[0]);

					for (int i = 1; i < keyPart.length; ++i) {
						string += ", ";
						string += GuiConfiguration.getMessage(keyPart[i]);
					}
				}

				totalStatisticsTablePanel.getTextArea().setText(string);

				topSearchPanel.getTitleButton().doClick();
				SearchTotalStatistics.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);

		ctrlMouseTable.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (ctrlMouseTable.getText().equalsIgnoreCase("@click")) {
					try {
						String playerID;

						playerID = totalStatisticsTableDataMap.get(tableIndex[1]).get(tableIndex[0]);

						SearchTotalStatistics.this.getParent().setVisible(false);
						MainFrame.getMainFrameInstance().getContentPane().remove(SearchTotalStatistics.this.getParent());

						MainFrame.getMainFrameInstance().getContentPane().add(
										new MenuBarPanel(new ViewPlayerGeneralInfo(playerID)),
										GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
						);

					} catch (Exception ignored) {
					} finally {
						ctrlMouseTable.setText("@null");
					}
				}
			}
		});
	}
}
