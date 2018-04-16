using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CBLServer.Models
{
    public class RigModel
    {
        CBL_Entities db = new CBL_Entities();

        public int AddRig(int user_id, string rig_name, string rig_processor, string rig_ram, string rig_motherboard, string rig_GPU,
            string rig_PSU, string rig_cooler, string rig_case)
        {
            rig newRig = new rig
            {
                user_id = user_id,
                rig_name = rig_name,
                rig_processor = rig_processor,
                rig_ram = rig_ram,
                rig_motherboard = rig_motherboard,
                rig_GPU = rig_GPU,
                rig_PSU = rig_PSU,
                rig_cooler = rig_cooler,
                rig_case = rig_case
            };

            db.rigs.Add(newRig);
            db.SaveChanges();

            return newRig.rig_id;
        }

        public void UpdateRig(int user_id, string rig_name, string rig_processor, string rig_ram, string rig_motherboard, string rig_GPU,
            string rig_PSU, string rig_cooler, string rig_case)
        {
            rig upddRig = db.rigs.Find(user_id);

            upddRig.rig_name = rig_name;
            upddRig.rig_processor = rig_processor;
            upddRig.rig_ram = rig_ram;
            upddRig.rig_motherboard = rig_motherboard;
            upddRig.rig_GPU = rig_GPU;
            upddRig.rig_PSU = rig_PSU;
            upddRig.rig_cooler = rig_cooler;
            upddRig.rig_case = rig_case;

            db.SaveChanges();
        }

        public void DeleteRig(int user_id)
        {
            rig delRig = db.rigs.Find(user_id);
            db.rigs.Attach(delRig);
            db.rigs.Remove(delRig);
            db.SaveChanges();
        }

        public List<rig> GetAllRigs()
        {
            var rigs = (from r in db.rigs
                        select r).ToList();

            return rigs;
        }

        public List<rig> GetRig(int user_id)
        {
            var rigs = (from r in db.rigs
                        where user_id == r.user_id
                        select r).ToList();
            return rigs;
        }
    }
}