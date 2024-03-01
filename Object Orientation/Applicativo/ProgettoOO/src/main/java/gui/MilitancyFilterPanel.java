package gui;

import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

public class MilitancyFilterPanel {
	public MilitancyFilterPanel()
	{
		final String selectAll = StringUtils.capitalize(GuiConfiguration.getMessage("selectAll"));

		final JLabel ctrlCompetitionSubName = new JLabel((String) null);
		final JLabel ctrlCompetitionType = new JLabel((String) null);
		final JLabel ctrlTeamType = new JLabel((String) null);
		final JLabel ctrlCountryType = new JLabel((String) null);
		final JLabel ctrlContinentName = new JLabel(selectAll);
		final JLabel ctrlNationName = new JLabel(selectAll);

		final Vector<String> continentNameVector = new Vector<>();
		final Map<String, String> continentNameMap = new HashMap<>();

		final Vector<String> nationNameVector = new Vector<>();
		final Map<String, String> nationNameMap = new HashMap<>();


		final Vector<Vector<String>> competitionTableData = new Vector<>();

		
	}
}
