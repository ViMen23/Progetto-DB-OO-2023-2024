package gui;

import controller.Controller;
import model.Team;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.Map;

public class AdminViewTeam
				extends JPanel
{
	public AdminViewTeam(String teamID, String teamType)
	{
		final Map<String,String> infoTeamMap = new HashMap<>();

		MigLayout migLayout;
		GeneralInfoPanel generalInfoPanel;
		TitleLabel titleLabel;
		JPanel panel;
		JButton updateGeneralInformationButton;
		JButton deleteTeamButton;
		JButton participationButton;
		JButton trophyButton;
		JButton prizeButton;

		String string;


		migLayout = new MigLayout(
						"debug, flowy",
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						""
		);
		setLayout(migLayout);


		Controller.getInstance().setTeamInfoMap(teamID, infoTeamMap);





		migLayout = new MigLayout(
						"debug",
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT,
						null
		);

		panel = new JPanel(migLayout);

		this.add(panel);

		updateGeneralInformationButton = new JButton("MODIFICA INFORMAZIONI GENERALI"); //TODO
		updateGeneralInformationButton.setCursor(GuiConfiguration.HAND_CURSOR);

		updateGeneralInformationButton.setEnabled(teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString()));

		panel.add(updateGeneralInformationButton);

		deleteTeamButton = new JButton("ELIMINA TEAM"); //TODO
		deleteTeamButton.setCursor(GuiConfiguration.HAND_CURSOR);

		panel.add(deleteTeamButton);

		participationButton = new JButton("INSERISCI/ELIMINA PARTECIPAZIONI");//TODO
		participationButton.setCursor(GuiConfiguration.HAND_CURSOR);

		panel.add(participationButton);

		trophyButton = new JButton("INSERISCI/ELIMINA TROFEI"); //TODO
		trophyButton.setCursor(GuiConfiguration.HAND_CURSOR);

		panel.add(trophyButton);

		prizeButton = new JButton("INSERISCI/ELIMINA PREMI"); //TODO
		prizeButton.setCursor(GuiConfiguration.HAND_CURSOR);


		updateGeneralInformationButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

			}
		});
	}
}
