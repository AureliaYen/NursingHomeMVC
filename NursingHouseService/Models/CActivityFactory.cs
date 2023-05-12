namespace NursingHouseService.Models
{
    public class CActivityFactory
    {
        private readonly fpdb2Context _context;

        public CActivityFactory(fpdb2Context fpdb2)
        {
            _context = fpdb2;
        }

        public void updatePeopleToActivity(int count, int activityNumber)
        {
            TActivity? ac = _context.TActivity.FirstOrDefault(p => p.ActId == activityNumber);
            ac.Act已報名人數 += count;
            _context.SaveChangesAsync();
        }

        public int checkPeopleToActivity(int activityNumber)
        {
            var ac = _context.TActivity.FirstOrDefault(p => p.ActId == activityNumber);
            int count = ac.Act最大人數 - ac.Act已報名人數;
            return count;
        }

    }
}
