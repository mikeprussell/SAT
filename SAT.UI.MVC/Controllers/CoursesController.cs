using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SAT.DATA.EF;
using SAT.UI.MVC.Utilities;

namespace SAT.UI.MVC.Controllers
{
    [Authorize(Roles = "Admin")]
    public class CoursesController : Controller
    {
        private SATEntities db = new SATEntities();

        // GET: Courses
        public ActionResult Index()
        {
            return View(db.Courses.ToList());
        }


        // GET: Courses
        public ActionResult ListView()
        {
            return View(db.Courses.ToList());
        }

        // GET: Courses
        public ActionResult ActiveInactiveCourses(string searchFilter, bool isActiveFilter)
        {
            ViewBag.IsActiveFilter = new SelectList(db.Courses.Select(x => x.IsActive).Distinct());

            if (String.IsNullOrEmpty(searchFilter))
            {
                var courses = db.Courses;
                return View(courses.ToList());
            }

            else if (!String.IsNullOrEmpty(searchFilter))
            {
                var courses = db.Courses.Where(x => x.CourseName.Contains(searchFilter));
                return View(courses.ToList());
            }

            else if (String.IsNullOrEmpty(searchFilter))
            {
                var courses = db.Courses.Where(x => x.IsActive == isActiveFilter);
                return View(courses.ToList());
            }

            else
            {
                var courses = db.Courses.Where(x => x.IsActive == isActiveFilter && x.CourseName.Contains(searchFilter));
                return View(courses.ToList());
            }

        }

        // GET: Courses/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // GET: Courses/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Courses/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CourseId,CourseName,CourseDescription,CreditHours,Curriculum,Notes,IsActive,CoursePhoto")] Course course, HttpPostedFileBase productImage)
        {
            if (ModelState.IsValid)
            {
                #region File Upload w/ Utility
                string file = "NoImage.png";

                if (productImage != null)
                {
                    file = productImage.FileName;

                    string ext = file.Substring(file.LastIndexOf("."));

                    string[] goodExts = { ".jpg", "jpeg", ".png", ".gif" };

                    if (goodExts.Contains(ext))
                    {
                        file = Guid.NewGuid() + ext;

                        #region Resize Image
                        //params for the Image Utility
                        //what we need: filepath, image file, maximum image size (full size), maximum thumb size (thumbnail)

                        string savePath = Server.MapPath("~/Content/img/studentimages/");

                        //image file
                        Image convertedImage = Image.FromStream(productImage.InputStream);

                        //max image size
                        int maxImageSize = 500;//value in pixels

                        int maxProdSize = 250;

                        //max thumb size
                        int maxThumbSize = 100;

                        //Call the ImageUtility to do work
                        ImageUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize, maxProdSize);

                        #endregion

                    }

                    else
                    {
                        file = "NoImage.png";
                    }

                    course.CoursePhoto = file;
                }

                #endregion

                db.Courses.Add(course);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(course);
        }

        // GET: Courses/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // POST: Courses/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CourseId,CourseName,CourseDescription,CreditHours,Curriculum,Notes,IsActive,CoursePhoto")] Course course, HttpPostedFileBase productImage)
        {
            if (ModelState.IsValid)
            {

                #region File Upload w/Utility
                //check to see if a new file has been uploaded. If not, the HiddenFor() from the View will maintain
                //the original value

                string file = "";

                if (productImage != null)
                {
                    //retrieve the name of the file so we can chekc it's extension
                    file = productImage.FileName;

                    //retrieve the extension
                    string ext = file.Substring(file.LastIndexOf("."));

                    string[] goodExts = { ".jpg", ".jpeg", ".gif", ".png" };

                    if (goodExts.Contains(ext))
                    {
                        //create a new file name (using a GUID so it will be unique)
                        file = Guid.NewGuid() + ext;

                        #region Resize Image
                        //params for the ResizeImage() method
                        string savePath = Server.MapPath("~/Content/img/studentimages/");

                        Image convertedImage = Image.FromStream(productImage.InputStream);

                        int maxImageSize = 500;

                        int maxProdSize = 250;

                        int maxThumbSize = 100;

                        //Call the Image service method to resize our Image
                        //ResizeImage() will save 2 resized copies of our original image -- 1 full size, and 1 thumbnail
                        ImageUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize, maxProdSize);
                        #endregion

                        #region Delete the old image
                        if (course.CoursePhoto != null && course.CoursePhoto != "NoImage.png")
                        {
                            string path = Server.MapPath("~/Content/img/studentimages/");
                            ImageUtility.Delete(path, course.CoursePhoto);

                        }
                        #endregion

                        course.CoursePhoto = file;

                    }

                }

                #endregion

                db.Entry(course).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(course);
        }

        // GET: Courses/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // POST: Courses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Course course = db.Courses.Find(id);
            db.Courses.Remove(course);
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
