package gui;

import controller.Controller;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.time.Year;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;

public class AdminViewCompetitionAddCompetitionEdition
				extends JPanel
{
	public AdminViewCompetitionAddCompetitionEdition(String competitionID, String competitionTeamType)
	{
		final JLabel ctrlYear = new JLabel((String) null);

		final Map<String, String> infoCompetitionMap = new LinkedHashMap<>();

		final Vector<String> yearVector = new Vector<>();
		final Map<String, String> yearMap = new HashMap<>();

		Controller.getInstance().setCompetitionInfoMap(competitionID, infoCompetitionMap);

		MigLayout migLayout;
		AdminTopViewCompetition adminTopViewCompetition;
		TitleLabel titleLabel;
		LabelComboPanel yearPanel;
		JButton confirmButton;

		String string;


		migLayout = new MigLayout(
						GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		adminTopViewCompetition = new AdminTopViewCompetition(competitionID, competitionTeamType, this);

		this.add(adminTopViewCompetition);
		adminTopViewCompetition.setGeneralInfoPanel(infoCompetitionMap);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("addCompetitionEdition"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		if (competitionTeamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
			string = GuiConfiguration.getMessage("season");
		}
		else {
			string = GuiConfiguration.getMessage("year");
		}

		yearPanel = new LabelComboPanel(
						string,
						true,
						ctrlYear
		);

		this.add(yearPanel);
		/*------------------------------------------------------------------------------------------------------*/

		confirmButton = new JButton(GuiConfiguration.getMessage("confirm"));
		confirmButton.setCursor(GuiConfiguration.HAND_CURSOR);
		confirmButton.setEnabled(false);

		this.add(confirmButton, GuiConfiguration.TOP_GAP_10_ADD_CONSTRAINT);

		confirmButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				int chosenOption;

				chosenOption = JOptionPane.showConfirmDialog(null,
								GuiConfiguration.getMessage("msgConfirmData"),
								GuiConfiguration.getMessage("addCompetitionEdition"),
								JOptionPane.YES_NO_OPTION
				);

				if (chosenOption == JOptionPane.YES_OPTION) {
					String message = Controller.getInstance().newCompetitionEdition(competitionID, yearMap.get(ctrlYear.getText()));

					JOptionPane.showMessageDialog(null, GuiConfiguration.getMessage(message));
				}

				try {
					AdminViewCompetitionAddCompetitionEdition.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewCompetitionAddCompetitionEdition.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewCompetitionAddCompetitionEdition(competitionID, competitionTeamType)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		ctrlYear.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlYear.getText(), "@fill")) {
					yearVector.clear();
					yearMap.clear();

					String string;

					if (competitionTeamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {

						for (int i = Year.now().getValue(); i >= GuiConfiguration.MIN_YEAR; --i) {
							string = String.valueOf(i);
							string += "/";
							string += String.valueOf(i + 1);

							yearVector.add(string);
							yearMap.put(string, String.valueOf(i));
						}
					} else {

						for (int i = Year.now().getValue(); i >= GuiConfiguration.MIN_YEAR; --i) {
							yearVector.add(String.valueOf(i));
							yearMap.put(String.valueOf(i), String.valueOf(i));
						}
					}

					yearPanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(yearVector));
				} else {
					confirmButton.setEnabled(null != ctrlYear.getText());
				}
			}
		});

	}

}
