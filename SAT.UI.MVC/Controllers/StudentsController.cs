using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SAT.DATA.EF;
using SAT.UI.MVC.Utilities;
using System.Drawing;
using Serilog; //to access LoggerConfiguration
namespace SAT.UI.MVC.Controllers
{
    [Authorize]
    public class StudentsController : Controller
    {
        private SATEntities db = new SATEntities();

        // GET: Students
        public ActionResult Index()
        {
            //SERILOG
            var students = db.Students.Include(s => s.StudentStatus);
            var stackifyLogger = new LoggerConfiguration()
                .MinimumLevel.Information().WriteTo.Stackify()
                .CreateLogger();
            stackifyLogger.Debug("Serilog Debug Student-Index");

            return View(students.ToList());
        }

        // GET: Students
        public ActionResult ListView()
        {
            var students = db.Students.Include(s => s.StudentStatus);
            return View(students.ToList());
        }

        // GET: Students/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = db.Students.Find(id);
            if (student == null)
            {
                return HttpNotFound();
            }
            return View(student);
        }

        // GET: Students/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            ViewBag.SSID = new SelectList(db.StudentStatuses, "SSID", "SSName");
            return View();
        }

        // POST: Students/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "StudentId,FirstName,LastName,Major,Address,City,State,ZipCode,Phone,Email,PhotoUrl,SSID")] Student student, HttpPostedFileBase productImage)
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

                    student.PhotoUrl = file;
                }

                #endregion

                db.Students.Add(student);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.SSID = new SelectList(db.StudentStatuses, "SSID", "SSName", student.SSID);
            return View(student);
        }

        // GET: Students/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = db.Students.Find(id);
            if (student == null)
            {
                return HttpNotFound();
            }
            ViewBag.SSID = new SelectList(db.StudentStatuses, "SSID", "SSName", student.SSID);
            return View(student);
        }

        // POST: Students/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "StudentId,FirstName,LastName,Major,Address,City,State,ZipCode,Phone,Email,PhotoUrl,SSID")] Student student, HttpPostedFileBase productImage)
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
                        if (student.PhotoUrl != null && student.PhotoUrl != "NoImage.png")
                        {
                            string path = Server.MapPath("~/Content/img/studentimages/");
                            ImageUtility.Delete(path, student.PhotoUrl);

                        }
                        #endregion

                        student.PhotoUrl = file;

                    }

                }

                #endregion

                db.Entry(student).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SSID = new SelectList(db.StudentStatuses, "SSID", "SSName", student.SSID);
            return View(student);
        }

        // GET: Students/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = db.Students.Find(id);
            if (student == null)
            {
                return HttpNotFound();
            }
            return View(student);
        }

        // POST: Students/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Student student = db.Students.Find(id);
            db.Students.Remove(student);
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
