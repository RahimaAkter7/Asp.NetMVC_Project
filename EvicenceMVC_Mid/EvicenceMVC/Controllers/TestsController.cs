﻿using EvicenceMVC.Models;
using EvicenceMVC.ViewModels;
using System;
using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Threading;

namespace EvicenceMVC.Controllers
{
    public class TestsController : Controller
    {

        DCMDbContext db = new DCMDbContext();
        // GET: Tests
        public ActionResult Index()
        {
            return View(db.Tests.Include(t1 => t1.TestType).ToList());
        }
        public ActionResult Create()
        {
            return View();
        }
        public PartialViewResult CreateTest()
        {
            ViewBag.TestTypes = db.TestTypes;
            return PartialView("_CreateTest");
        }
        [HttpPost]
        public PartialViewResult CreateTest(Test b)
        {
            Thread.Sleep(3000);
            if (ModelState.IsValid)
            {
                db.Tests.Add(b);
                db.SaveChanges();
                return PartialView("_success");
            }
            ViewBag.TestTypes = db.TestTypes;
            return PartialView("_error");
        }
        public ActionResult Edit(int id)
        {
            ViewBag.TestTypes = db.TestTypes;
            ViewBag.Id = id;
            return View();
        }
        public PartialViewResult EditTest(int id)
        {
            ViewBag.TestTypes = db.TestTypes;
            var b = db.Tests.First(x => x.TestId == id);
            return PartialView("_EditTest", b);
        }
        [HttpPost]
        public PartialViewResult EditTest(Test b)
        {
            Thread.Sleep(4000);
            if (ModelState.IsValid)
            {
                db.Entry(b).State = EntityState.Modified;
                db.SaveChanges();
                return PartialView("_success");
            }
            ViewBag.TestTypes = db.TestTypes;
            return PartialView("_error");
        }
        public ActionResult Delete(int id)
        {
            return View(db.Tests.First(x => x.TestId == id));
        }
        [HttpPost]
        [ActionName("Delete")]
        public ActionResult DoDelete(int TestId)
        {
            var b = new Test { TestId = TestId };
            db.Entry(b).State = EntityState.Deleted;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}