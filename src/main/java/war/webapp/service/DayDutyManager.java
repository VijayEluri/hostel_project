package war.webapp.service;

import war.webapp.model.DayDuty;
import war.webapp.model.User;

import java.util.Calendar;
import java.util.List;

public interface DayDutyManager extends GenericManager<DayDuty, Long> {

    public DayDuty loadDayDutyByDateAndFloor(Calendar date, String floor);

    public List<DayDuty> loadAllDayDutyByDateAndFloor(Integer year, Integer month, String floor);

    public DayDuty saveDayDuty(DayDuty dayDuty);

    public void deleteDayDuty(DayDuty dayDuty);

    public void deleteFirstDutyUser(DayDuty dayDuty);

    public void deleteSecondDutyUser(DayDuty dayDuty);

    public List<DayDuty> loadDutiesByUser(User user);
}
