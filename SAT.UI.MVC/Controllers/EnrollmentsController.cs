using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SAT.DATA.EF;
using Serilog;

namespace SAT.UI.MVC.Controllers
{
    [Authorize]
    public class EnrollmentsController : Controller
    {
        //log4net log method
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        private SATEntities db = new SATEntities();

        // GET: Enrollments
        public ActionResult Index()
        {
            //LOG4NET
            log.Info("Enrollment-Log");
            var enrollments = db.Enrollments.Include(e => e.ScheduledClass).Include(e => e.Student);
            return View(enrollments.ToList());
        }
        

        // GET: Enrollments
        public ActionResult ListView()
        {
            var enrollments = db.Enrollments.Include(e => e.ScheduledClass).Include(e => e.Student);
            return View(enrollments.ToList());
        }

        // GET: Enrollments/Details/5
        public ActionResult Details(int? id)
        {
            //LOG4NET
            log.Fatal("Log4net to Retrace Enrollment-Details");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Enrollment enrollment = db.Enrollments.Find(id);
            if (enrollment == null)
            {
                return HttpNotFound();
            }
            return View(enrollment);
        }

        // GET: Enrollments/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            // ViewBag.ScheduledClassId = new SelectList(db.ScheduledClasses, "ScheduledClassId", "CourseId", "CourseName");
            ViewBag.ScheduledClassId = new SelectList(db.ScheduledClasses.Where (x => x.SCSID == 1), "ScheduledClassId", "ScheduledClassSummary");
            ViewBag.StudentId = new SelectList(db.Students, "StudentId", "FullName");
            // TODO: Link CourseName instead of CourseId
                    
            return View();
        }

        // POST: Enrollments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "EnrollmentId,StudentId,ScheduledClassId,EnrollmentDate")] Enrollment enrollment)
        {
            if (ModelState.IsValid)
            {
                db.Enrollments.Add(enrollment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
           // ViewBag.ScheduledClassId = new SelectList(db.ScheduledClasses, "ScheduledClassId", "CourseId", "CourseName", enrollment.ScheduledClassId);
            ViewBag.ScheduledClassId = new SelectList(db.ScheduledClasses, "ScheduledClassId", "InstructorName", enrollment.ScheduledClassId);
            ViewBag.StudentId = new SelectList(db.Students, "StudentId", "FullName", enrollment.StudentId);
            return View(enrollment);
        }

        // GET: Enrollments/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Enrollment enrollment = db.Enrollments.Find(id);
            if (enrollment == null)
            {
                return HttpNotFound();
            }
            ViewBag.ScheduledClassId = new SelectList(db.ScheduledClasses.Where(x => x.SCSID == 1), "ScheduledClassId", "InstructorName", enrollment.ScheduledClassId);
            ViewBag.StudentId = new SelectList(db.Students, "StudentId", "FullName", enrollment.StudentId);
            return View(enrollment);
        }

        // POST: Enrollments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "EnrollmentId,StudentId,ScheduledClassId,EnrollmentDate")] Enrollment enrollment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(enrollment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ScheduledClassId = new SelectList(db.ScheduledClasses, "ScheduledClassId", "InstructorName", enrollment.ScheduledClassId);
            ViewBag.StudentId = new SelectList(db.Students, "StudentId", "FullName", enrollment.StudentId);
            return View(enrollment);
        }

        // GET: Enrollments/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Enrollment enrollment = db.Enrollments.Find(id);
            if (enrollment == null)
            {
                return HttpNotFound();
            }
            return View(enrollment);
        }

        // POST: Enrollments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Enrollment enrollment = db.Enrollments.Find(id);
            db.Enrollments.Remove(enrollment);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
