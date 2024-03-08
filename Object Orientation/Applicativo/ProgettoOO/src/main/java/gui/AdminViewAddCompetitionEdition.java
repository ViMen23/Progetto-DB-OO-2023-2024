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

public class AdminViewAddCompetitionEdition
				extends JPanel
{
	public AdminViewAddCompetitionEdition(String competitionID, String competitionTeamType)
	{
		final JLabel ctrlYear = new JLabel((String) null);

		final Map<String, String> infoCompetitionMap = new LinkedHashMap<>();

		final Vector<String> yearVector = new Vector<>();
		final Map<String, String> yearMap = new HashMap<>();


		System.out.println(competitionTeamType);

		Controller.getInstance().setCompetitionInfoMap(competitionID, infoCompetitionMap);


		MigLayout migLayout;
		AdminTopViewCompetition adminTopViewCompetition;
		TitleLabel titleLabel;

		LabelComboPanel yearPanel;
		JButton confirmButton;


		migLayout = new MigLayout(
						GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_FILL_SIZE_70P_LAYOUT_CONSTRAINT,
						GuiConfiguration.SIX_CELL_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		adminTopViewCompetition = new AdminTopViewCompetition(competitionID, competitionTeamType);

		this.add(adminTopViewCompetition);
		adminTopViewCompetition.setGeneralInfoPanel(infoCompetitionMap);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("addCompetitionEdition"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		yearPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("year"),
						true,
						ctrlYear
		);

		this.add(yearPanel);
		/*------------------------------------------------------------------------------------------------------*/

		confirmButton = new JButton(GuiConfiguration.getMessage("confirm"));
		confirmButton.setCursor(GuiConfiguration.HAND_CURSOR);
		confirmButton.setEnabled(false);

		this.add(confirmButton);

		confirmButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showConfirmDialog(null, "SEI SICURO DI AVER INSERITO I DATI CORRETTAMENTE"); //TODO

				String message = Controller.getInstance().createCompetitionEdition(competitionID, yearMap.get(ctrlYear.getText()));

				System.out.println(message);
			}
		});

		ctrlYear.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlYear.getText(), "@fill")) {
					yearVector.clear();
					yearMap.clear();

					int dYear = Year.now().getValue();
					String string;

					if (competitionTeamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {

						for (int i = GuiConfiguration.MIN_YEAR; i < dYear; ++i) {
							string = String.valueOf(i);
							string += "/";
							string += String.valueOf(i + 1);

							yearVector.add(string);
							yearMap.put(string, String.valueOf(i));
						}
					} else {
						for (int i = GuiConfiguration.MIN_YEAR; i < dYear; ++i) {
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
