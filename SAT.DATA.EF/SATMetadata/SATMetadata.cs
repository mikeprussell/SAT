using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SAT.DATA.EF//SATMetadata
{
    public class CourseMetadata
    {
        [Required(ErrorMessage = "*Course ID is required")]
        [Display(Name = "Course ID")]
        public int CourseId { get; set; }

        [Required(ErrorMessage = "*Course Name is required")]
        [StringLength(50, ErrorMessage = "*Cannot exceed 50 characters")]
        [Display(Name = "Course Name")]
        public string CourseName { get; set; }

        [Required(ErrorMessage = "*Course Description is required")]
        [Display(Name = "Course Description")]
        public string CourseDescription { get; set; }

        [Required(ErrorMessage = "*Course Hours are required")]
        [Display(Name = "Credit Hours")]
        public byte CreditHours { get; set; }

        [StringLength(250, ErrorMessage = "*Cannot exceed 250 characters")]
        [Display(Name = "Curriculum")]
        public string Curriculum { get; set; }

        [StringLength(500, ErrorMessage = "*Cannot exceed 500 characters")]
        [Display(Name = "Notes")]
        public string Notes { get; set; }

        public string CoursePhoto { get; set; }

        public bool IsActive { get; set; }
       
    }

    [MetadataType(typeof(CourseMetadata))]
    public partial class Course
    {

    }

    public class EnrollmentMetadata
    {
        [Required(ErrorMessage = "*Enrollment ID is required")]
        [Display(Name = "Enrollment ID")]
        public int EnrollmentId { get; set; }

        [Required(ErrorMessage = "*Student ID is required")]
        [Display(Name = "Student ID")]
        public int StudentId { get; set; }

        [Required(ErrorMessage = "*Scheduled Class ID is required")]
        [Display(Name = "Scheduled Class ID")]
        public int ScheduledClassId { get; set; }

        [Required(ErrorMessage = "*Enrollment Date is required")]
        [Display(Name = "Enrollment Date")]
        public System.DateTime EnrollmentDate { get; set; }

        [Display(Name = "Scheduled Class")]
        public virtual ScheduledClass ScheduledClass { get; set; }

        public virtual Student Student { get; set; }

      
    }

    [MetadataType(typeof(EnrollmentMetadata))]
    public partial class Enrollment
    {

    }

    public class ScheduledClassMetadata
    {
        [Required(ErrorMessage = "*Scheduled Class ID is required")]
        [Display(Name = "Scheduled Class ID")]
        public int ScheduledClassId { get; set; }

        [Required(ErrorMessage = "*Course ID is required")]
        [Display(Name = "Course ID")]
        public int CourseId { get; set; }

        [Required(ErrorMessage = "*Start Date is required")]
        [Display(Name = "Start Date")]
        public System.DateTime StartDate { get; set; }

        [Required(ErrorMessage = "*End Date is required")]
        [Display(Name = "End Date")]
        public System.DateTime EndDate { get; set; }

        [Required(ErrorMessage = "*Instructor Name is required")]
        [StringLength(40, ErrorMessage = "*Cannot exceed 40 characters")]
        [Display(Name = "Instructor Name")]
        public string InstructorName { get; set; }

        [Required(ErrorMessage = "*Location is required")]
        [StringLength(20, ErrorMessage = "*Cannot exceed 20 characters")]
        public string Location { get; set; }

        [Display(Name = "Scheduled Class Status ID")]
        public Nullable<int> SCSID { get; set; }

       
    }
    [MetadataType(typeof(ScheduledClassMetadata))]
    public partial class ScheduledClass
    {

    }

    public class ScheduledClassStatusMetadata
    {
        [Required(ErrorMessage = "*Scheduled Class Status ID is required")]
        [Display(Name = "Scheduled Class Status ID")]
        public int SCSID { get; set; }

        [Required(ErrorMessage = "*Status Name is required")]
        [StringLength(50, ErrorMessage = "*Cannot exceed 50 characters")]
        [Display(Name = "Status Name")]
        public string SCSName { get; set; }

       
    }
    [MetadataType(typeof(ScheduledClassStatusMetadata))]
    public partial class ScheduledClassStatus
    {

    }

    public class StudentMetadata
    {
        [Required(ErrorMessage = "*Student ID is required")]
        [Display(Name = "Student ID")]
        public int StudentId { get; set; }

        [StringLength(20, ErrorMessage = "*Cannot exceed 20 characters")]
        [Required(ErrorMessage = "*First Name is required")]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [StringLength(20, ErrorMessage = "*Cannot exceed 20 characters")]
        [Required(ErrorMessage = "*Last Name is required")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [StringLength(15, ErrorMessage = "*Cannot exceed 15 characters")]
        public string Major { get; set; }

        [StringLength(50, ErrorMessage = "*Cannot exceed 50 characters")]
        public string Address { get; set; }

        [StringLength(25, ErrorMessage = "*Cannot exceed 25 characters")]
        public string City { get; set; }

        [StringLength(2, ErrorMessage = "*Cannot exceed 2 characters")]
        public string State { get; set; }

        [StringLength(10, ErrorMessage = "*Cannot exceed 10 characters")]
        [Display(Name = "Zip Code")]
        public string ZipCode { get; set; }

        [StringLength(13, ErrorMessage = "*Cannot exceed 13 characters")]
        public string Phone { get; set; }

        [StringLength(60, ErrorMessage = "*Cannot exceed 60 characters")]
        [Required(ErrorMessage = "*Email is required")]
        public string Email { get; set; }

        [StringLength(100, ErrorMessage = "*Cannot exceed 100 characters")]
        public string PhotoUrl { get; set; }

        [Display(Name = "Student Status ID")]
        [Required(ErrorMessage = "*Student Status ID is required")]
        public int SSID { get; set; }

        
    }
    [MetadataType(typeof(StudentMetadata))]
    public partial class Student
    {

    }

    public class StudentStatusMetadata
    {
        [Display(Name = "Student Status ID")]
        [Required(ErrorMessage = "*Student Status ID is required")]
        public int SSID { get; set; }

        [Display(Name = "Student Status")]
        [Required(ErrorMessage = "*Student Status is required")]
        public string SSName { get; set; }

        [Display(Name = "Student Status Description")]
        [StringLength(250, ErrorMessage = "*Cannot exceed 250 characters")]
        public string SSDescription { get; set; }

     
    }
    [MetadataType(typeof(StudentStatusMetadata))]
    public partial class StudentStatus
    {

    }

}
