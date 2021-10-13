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
        public int CourseId { get; set; }

        [StringLength(15, ErrorMessage = "*Cannot exceed 50 characters")]
        [Display(Name = "Course Name")]
        public string CourseName { get; set; }


        [Display(Name = "Course Description")]
        public string CourseDescription { get; set; }

        [Display(Name = "Credit Hours")]
        public byte CreditHours { get; set; }

        [StringLength(15, ErrorMessage = "*Cannot exceed 250 characters")]
        [Display(Name = "Curriculum")]
        public string Curriculum { get; set; }

        [StringLength(15, ErrorMessage = "*Cannot exceed 500 characters")]
        [Display(Name = "Notes")]
        public string Notes { get; set; }

        public Nullable<bool> IsActive { get; set; }

        [MetadataType(typeof(CourseMetadata))]
        public partial class Course
        {

        }
    }

    public class EnrollmentMetadata
    {
        [Display(Name = "Enrollment ID")]
        public int EnrollmentId { get; set; }

        [StringLength(15, ErrorMessage = "*Cannot exceed 50 characters")]
        [Display(Name = "Student ID")]

        public int StudentId { get; set; }
        public int ScheduledClassId { get; set; }
        public System.DateTime EnrollmentDate { get; set; }

        public virtual ScheduledClass ScheduledClass { get; set; }
        public virtual Student Student { get; set; }

        [MetadataType(typeof(EnrollmentMetadata))]
        public partial class Enrollment
        {

        }
    }

    public class ScheduledClassMetadata
    {
        public int ScheduledClassId { get; set; }
        public int CourseId { get; set; }
        public System.DateTime StartDate { get; set; }
        public System.DateTime EndDate { get; set; }
        public string InstructorName { get; set; }
        public string Location { get; set; }
        public Nullable<int> SCSID { get; set; }

        [MetadataType(typeof(ScheduledClassMetadata))]
        public partial class ScheduledClass
        {

        }
    }

    public class ScheduledClassStatusMetadata
    {
        public int SCSID { get; set; }
        public string SCSName { get; set; }

        [MetadataType(typeof(ScheduledClassStatusMetadata))]
        public partial class ScheduledClassStatus
        {

        }
    }

    public class StudentMetadata
    {
        public int StudentId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Major { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string PhotoUrl { get; set; }
        public int SSID { get; set; }

        [MetadataType(typeof(StudentMetadata))]
        public partial class Student
        {

        }
    }

    public class StudentStatusMetadata
    {
        public int SCSID { get; set; }
        public string SCSName { get; set; }

        [MetadataType(typeof(ScheduledClassStatusMetadata))]
        public partial class StudentStatus
        {

        }
    }

}
