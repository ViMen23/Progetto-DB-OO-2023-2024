package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;

public class AdminSearchTeam
				extends JPanel
{
	public AdminSearchTeam()
	{
		MigLayout migLayout;
		JTabbedPane searchTeam;


		migLayout = new MigLayout(
						"",
						"",
						""
		);

		this.setLayout(migLayout);

		searchTeam = new JTabbedPane(JTabbedPane.TOP);
		searchTeam.addTab("RicercaTeam", new SearchTeamPanel());
		searchTeam.addTab("FiltraTeam", new StepFilterPanel());

		this.add(searchTeam);
	}
}
