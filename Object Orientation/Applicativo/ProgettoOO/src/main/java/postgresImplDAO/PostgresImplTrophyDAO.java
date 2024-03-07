package postgresImplDAO;

import dao.TrophyDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;
import model.Team;

import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

public class PostgresImplTrophyDAO
				implements TrophyDAO
{
	private Connection conn;

	public PostgresImplTrophyDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void fetchTrophyDB(String teamID,
														List<String> listTrophyID,
														List<String> listTrophyName,
														List<String> listCompetitionID,
														List<String> listCompetitionStartYear,
														List<String> listCompetitionName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call trophy_team(?)}");
			cs.setString(1, teamID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listTrophyID.add(rs.getString("trophy_id"));
				listTrophyName.add(rs.getString("trophy_name"));
				listCompetitionID.add(rs.getString("comp_id"));
				listCompetitionStartYear.add(rs.getString("comp_start_year"));
				listCompetitionName.add(rs.getString("comp_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchTrophyDB(String playerID,
														String teamType,
														List<String> listCompetitionStartYear,
														List<String> listCompetitionID,
														List<String> listCompetitionName,
														List<String> listTeamID,
														List<String> listTeamLongName,
														List<String> listTrophyName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_trophy_case(?, ?)}");
			cs.setString(1, playerID);
			cs.setString(2, teamType);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listCompetitionStartYear.add(rs.getString("comp_start_year"));
				listCompetitionID.add(rs.getString("comp_id"));
				listCompetitionName.add(rs.getString("comp_name"));
				listTeamID.add(rs.getString("team_id"));
				listTeamLongName.add(rs.getString("team_long_name"));
				listTrophyName.add(rs.getString("trophy_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void newTrophyTeam(String teamID,
														String trophyID,
														String competitionID,
														String competitionStartYear,
														String message)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{? = call new_trophy_team(?, ?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, teamID);
			cs.setString(3, trophyID);
			cs.setString(4, competitionID);
			cs.setString(5, competitionStartYear);

			cs.execute();

			message = cs.getString(1);

			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void deleteTrophyTeam(String teamID,
															 String trophyID,
															 String competitionID,
															 String competitionStartYear,
															 String message)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{? = call delete_trophy_team(?, ?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, teamID);
			cs.setString(3, trophyID);
			cs.setString(4, competitionID);
			cs.setString(5, competitionStartYear);

			cs.execute();

			message = cs.getString(1);

			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchTrophy(String teamID,
													String teamType,
													Vector<Vector<String>> tableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call trophy_team(?)}");
			cs.setString(1, teamID);

			ResultSet rs = cs.executeQuery();


			if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
				String season = null;
				while (rs.next()) {
					Vector<String> vector = new Vector<>();

					season = rs.getString("comp_start_year");
					season += "/";
					season += (Integer.parseInt(rs.getString("comp_start_year")) + 1);

					vector.add(season);
					vector.add(rs.getString("comp_name"));
					vector.add(GuiConfiguration.getMessage(rs.getString("trophy_name")));

					tableData.add(vector);
				}
			} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
				while (rs.next()) {
					Vector<String> vector = new Vector<>();

					vector.add(rs.getString("comp_start_year"));
					vector.add(rs.getString("comp_name"));
					vector.add(GuiConfiguration.getMessage(rs.getString("trophy_name")));

					tableData.add(vector);
				}
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchTrophy(String playerID,
													String teamType,
													Vector<Vector<String>> tableData,
													Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_trophy_case(?, ?)}");
			cs.setString(1, playerID);
			cs.setString(2, teamType);

			ResultSet rs = cs.executeQuery();


			Map<Integer, String> teamMap = new HashMap<>();

			if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
				String season = null;
				while (rs.next()) {
					Vector<String> vector = new Vector<>();

					season = rs.getString("comp_start_year");
					season += "/";
					season += (Integer.parseInt(rs.getString("comp_start_year")) + 1);

					vector.add(season);
					vector.add(rs.getString("comp_name"));
					vector.add(rs.getString("team_long_name"));
					vector.add(GuiConfiguration.getMessage(rs.getString("trophy_name")));

					tableData.add(vector);
					teamMap.put(rs.getRow() - 1, rs.getString("team_id"));
				}
			} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
				while (rs.next()) {
					Vector<String> vector = new Vector<>();

					vector.add(rs.getString("comp_start_year"));
					vector.add(rs.getString("comp_name"));
					vector.add(rs.getString("team_long_name"));
					vector.add(GuiConfiguration.getMessage(rs.getString("trophy_name")));

					tableData.add(vector);
					teamMap.put(rs.getRow() - 1, rs.getString("team_id"));
				}
			}

			tableMap.put(2, teamMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}
