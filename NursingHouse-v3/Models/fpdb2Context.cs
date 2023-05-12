using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace NursingHouse_v3.Models
{
    public partial class fpdb2Context : DbContext
    {
        public fpdb2Context()
        {
        }

        public fpdb2Context(DbContextOptions<fpdb2Context> options)
            : base(options)
        {
        }

        public virtual DbSet<TActivity> TActivities { get; set; } = null!;
        public virtual DbSet<TActivityCollect> TActivityCollects { get; set; } = null!;
        public virtual DbSet<TActivityComment> TActivityComments { get; set; } = null!;
        public virtual DbSet<TActivityMessage> TActivityMessages { get; set; } = null!;
        public virtual DbSet<TActivityOrder> TActivityOrders { get; set; } = null!;
        public virtual DbSet<TApplicationForm> TApplicationForms { get; set; } = null!;
        public virtual DbSet<TBed> TBeds { get; set; } = null!;
        public virtual DbSet<TEmployee> TEmployees { get; set; } = null!;
        public virtual DbSet<TFamilyMember> TFamilyMembers { get; set; } = null!;
        public virtual DbSet<TImage> TImages { get; set; } = null!;
        public virtual DbSet<TMeal> TMeals { get; set; } = null!;
        public virtual DbSet<TMember> TMembers { get; set; } = null!;
        public virtual DbSet<TNursingRecord> TNursingRecords { get; set; } = null!;
        public virtual DbSet<TOffService> TOffServices { get; set; } = null!;
        public virtual DbSet<TOrder> TOrders { get; set; } = null!;
        public virtual DbSet<TOrderMeal> TOrderMeals { get; set; } = null!;
        public virtual DbSet<TPatientInfo> TPatientInfos { get; set; } = null!;
        public virtual DbSet<TProduct> TProducts { get; set; } = null!;
        public virtual DbSet<TRoombed> TRoombeds { get; set; } = null!;
        public virtual DbSet<TShift> TShifts { get; set; } = null!;
        public virtual DbSet<TSupplier> TSuppliers { get; set; } = null!;
        public virtual DbSet<TTake> TTakes { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=.;Initial Catalog=fpdb2;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TActivity>(entity =>
            {
                entity.HasKey(e => e.ActId)
                    .HasName("PK_tActivityNumber");

                entity.ToTable("tActivity");

                entity.Property(e => e.ActId).HasColumnName("actId");

                entity.Property(e => e.Act主講人)
                    .HasMaxLength(50)
                    .HasColumnName("act主講人");

                entity.Property(e => e.Act主講人描述).HasColumnName("act主講人描述");

                entity.Property(e => e.Act修改日期)
                    .HasColumnType("datetime")
                    .HasColumnName("act修改日期");

                entity.Property(e => e.Act備註)
                    .HasMaxLength(50)
                    .HasColumnName("act備註");

                entity.Property(e => e.Act價格).HasColumnName("act價格");

                entity.Property(e => e.Act公開狀態).HasColumnName("act公開狀態");

                entity.Property(e => e.Act地點)
                    .HasMaxLength(50)
                    .HasColumnName("act地點");

                entity.Property(e => e.Act報名截止日)
                    .HasColumnType("datetime")
                    .HasColumnName("act報名截止日");

                entity.Property(e => e.Act已報名人數).HasColumnName("act已報名人數");

                entity.Property(e => e.Act建立日期)
                    .HasColumnType("datetime")
                    .HasColumnName("act建立日期");

                entity.Property(e => e.Act最大人數).HasColumnName("act最大人數");

                entity.Property(e => e.Act最後修改人)
                    .HasMaxLength(50)
                    .HasColumnName("act最後修改人");

                entity.Property(e => e.Act注意事項).HasColumnName("act注意事項");

                entity.Property(e => e.Act活動名稱)
                    .HasMaxLength(50)
                    .HasColumnName("act活動名稱");

                entity.Property(e => e.Act活動圖片).HasColumnName("act活動圖片");

                entity.Property(e => e.Act活動日期)
                    .HasColumnType("datetime")
                    .HasColumnName("act活動日期");

                entity.Property(e => e.Act活動編號)
                    .HasMaxLength(50)
                    .HasColumnName("act活動編號");

                entity.Property(e => e.Act活動說明).HasColumnName("act活動說明");

                entity.Property(e => e.Act結案).HasColumnName("act結案");

                entity.Property(e => e.EId).HasColumnName("eId");

                entity.HasOne(d => d.EIdNavigation)
                    .WithMany(p => p.TActivities)
                    .HasForeignKey(d => d.EId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tActivityNumber_tEmployee");
            });

            modelBuilder.Entity<TActivityCollect>(entity =>
            {
                entity.HasKey(e => e.AcoId);

                entity.ToTable("tActivityCollect");

                entity.Property(e => e.AcoId).HasColumnName("acoId");

                entity.Property(e => e.Aco備註).HasColumnName("aco備註");

                entity.Property(e => e.Aco收藏).HasColumnName("aco收藏");

                entity.Property(e => e.Aco會員Id).HasColumnName("aco會員Id");

                entity.Property(e => e.Aco活動Id).HasColumnName("aco活動Id");

                entity.HasOne(d => d.Aco會員)
                    .WithMany(p => p.TActivityCollects)
                    .HasForeignKey(d => d.Aco會員Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tActivityCollect_tMember");

                entity.HasOne(d => d.Aco活動)
                    .WithMany(p => p.TActivityCollects)
                    .HasForeignKey(d => d.Aco活動Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tActivityCollect_tActivityNumber");
            });

            modelBuilder.Entity<TActivityComment>(entity =>
            {
                entity.HasKey(e => e.AcId);

                entity.ToTable("tActivityComment");

                entity.Property(e => e.AcId).HasColumnName("acId");

                entity.Property(e => e.Ac備註)
                    .HasMaxLength(50)
                    .HasColumnName("ac備註");

                entity.Property(e => e.Ac會員Id).HasColumnName("ac會員Id");

                entity.Property(e => e.Ac活動編號).HasColumnName("ac活動編號");

                entity.Property(e => e.Ac評價).HasColumnName("ac評價");

                entity.HasOne(d => d.Ac會員)
                    .WithMany(p => p.TActivityComments)
                    .HasForeignKey(d => d.Ac會員Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tActivityComment_tMember");

                entity.HasOne(d => d.Ac活動編號Navigation)
                    .WithMany(p => p.TActivityComments)
                    .HasForeignKey(d => d.Ac活動編號)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tActivityComment_tActivityNumber");
            });

            modelBuilder.Entity<TActivityMessage>(entity =>
            {
                entity.HasKey(e => e.AmId);

                entity.ToTable("tActivityMessage");

                entity.Property(e => e.AmId).HasColumnName("amId");

                entity.Property(e => e.Am備註)
                    .HasMaxLength(50)
                    .HasColumnName("am備註");

                entity.Property(e => e.Am報名成功).HasColumnName("am報名成功");

                entity.Property(e => e.Am會員Id).HasColumnName("am會員Id");

                entity.Property(e => e.Am活動編號).HasColumnName("am活動編號");

                entity.Property(e => e.Am發送次數).HasColumnName("am發送次數");

                entity.Property(e => e.Am緊急訊息).HasColumnName("am緊急訊息");

                entity.Property(e => e.Am繳費通知).HasColumnName("am繳費通知");

                entity.Property(e => e.Am行前通知).HasColumnName("am行前通知");

                entity.HasOne(d => d.Am會員)
                    .WithMany(p => p.TActivityMessages)
                    .HasForeignKey(d => d.Am會員Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tActivityMessage_tMember");
            });

            modelBuilder.Entity<TActivityOrder>(entity =>
            {
                entity.HasKey(e => e.AoId);

                entity.ToTable("tActivityOrder");

                entity.Property(e => e.AoId).HasColumnName("aoId");

                entity.Property(e => e.Ao修改人).HasColumnName("ao修改人");

                entity.Property(e => e.Ao修改日期)
                    .HasColumnType("datetime")
                    .HasColumnName("ao修改日期");

                entity.Property(e => e.Ao備註)
                    .HasMaxLength(50)
                    .HasColumnName("ao備註");

                entity.Property(e => e.Ao參加人Email).HasColumnName("ao參加人Email");

                entity.Property(e => e.Ao參加人姓名).HasColumnName("ao參加人姓名");

                entity.Property(e => e.Ao參加人電話).HasColumnName("ao參加人電話");

                entity.Property(e => e.Ao參與人數).HasColumnName("ao參與人數");

                entity.Property(e => e.Ao會員Id).HasColumnName("ao會員Id");

                entity.Property(e => e.Ao活動編號).HasColumnName("ao活動編號");

                entity.Property(e => e.Ao結案).HasColumnName("ao結案");

                entity.Property(e => e.Ao訂單建立日期)
                    .HasColumnType("datetime")
                    .HasColumnName("ao訂單建立日期");

                entity.Property(e => e.Ao訂單進度)
                    .HasMaxLength(50)
                    .HasColumnName("ao訂單進度");

                entity.Property(e => e.Ao金額).HasColumnName("ao金額");

                entity.HasOne(d => d.Ao會員)
                    .WithMany(p => p.TActivityOrders)
                    .HasForeignKey(d => d.Ao會員Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tActivityOrder_tMember");

                entity.HasOne(d => d.Ao活動編號Navigation)
                    .WithMany(p => p.TActivityOrders)
                    .HasForeignKey(d => d.Ao活動編號)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tActivityOrder_tActivityNumber");
            });

            modelBuilder.Entity<TApplicationForm>(entity =>
            {
                entity.HasKey(e => e.AppId)
                    .HasName("PK_外出人員申請資料");

                entity.ToTable("tApplicationForm");

                entity.Property(e => e.AppId).HasColumnName("appId");

                entity.Property(e => e.App事由)
                    .HasMaxLength(50)
                    .HasColumnName("app事由");

                entity.Property(e => e.App修改人員).HasColumnName("app修改人員");

                entity.Property(e => e.App修改時間)
                    .HasColumnType("datetime")
                    .HasColumnName("app修改時間");

                entity.Property(e => e.App備註)
                    .HasMaxLength(50)
                    .HasColumnName("app備註");

                entity.Property(e => e.App出發時間)
                    .HasColumnType("datetime")
                    .HasColumnName("app出發時間");

                entity.Property(e => e.App地點)
                    .HasMaxLength(50)
                    .HasColumnName("app地點");

                entity.Property(e => e.App外出日期)
                    .HasColumnType("datetime")
                    .HasColumnName("app外出日期");

                entity.Property(e => e.App審核)
                    .HasMaxLength(50)
                    .HasColumnName("app審核");

                entity.Property(e => e.App現況).HasColumnName("app現況");

                entity.Property(e => e.App申請人)
                    .HasMaxLength(50)
                    .HasColumnName("app申請人");

                entity.Property(e => e.App申請日期)
                    .HasColumnType("datetime")
                    .HasColumnName("app申請日期");

                entity.Property(e => e.App結案)
                    .HasMaxLength(50)
                    .HasColumnName("app結案");

                entity.Property(e => e.App聯絡方式)
                    .HasMaxLength(50)
                    .HasColumnName("app聯絡方式");

                entity.Property(e => e.App返回時間)
                    .HasColumnType("datetime")
                    .HasColumnName("app返回時間");

                entity.Property(e => e.App陪同人員)
                    .HasMaxLength(50)
                    .HasColumnName("app陪同人員");

                entity.Property(e => e.App預計外出時間).HasColumnName("app預計外出時間");

                entity.Property(e => e.EId).HasColumnName("eId");

                entity.Property(e => e.FamId).HasColumnName("famId");

                entity.Property(e => e.OId).HasColumnName("oId");

                entity.Property(e => e.PId).HasColumnName("pId");

                entity.HasOne(d => d.EIdNavigation)
                    .WithMany(p => p.TApplicationForms)
                    .HasForeignKey(d => d.EId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tApplicationForm_tEmployee");

                entity.HasOne(d => d.Fam)
                    .WithMany(p => p.TApplicationForms)
                    .HasForeignKey(d => d.FamId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tApplicationForm_tFamilyMembers");

                entity.HasOne(d => d.PIdNavigation)
                    .WithMany(p => p.TApplicationForms)
                    .HasForeignKey(d => d.PId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tApplicationForm_tPatientInfo");
            });

            modelBuilder.Entity<TBed>(entity =>
            {
                entity.HasKey(e => e.BId)
                    .HasName("PK_Bed");

                entity.ToTable("tBed");

                entity.Property(e => e.BId).HasColumnName("bId");

                entity.Property(e => e.B修改日期)
                    .HasColumnType("datetime")
                    .HasColumnName("b修改日期");

                entity.Property(e => e.B修改者工號)
                    .HasMaxLength(50)
                    .HasColumnName("b修改者工號");

                entity.Property(e => e.B入住時間)
                    .HasColumnType("datetime")
                    .HasColumnName("b入住時間");

                entity.Property(e => e.B建立日期)
                    .HasColumnType("datetime")
                    .HasColumnName("b建立日期");

                entity.Property(e => e.B建立者工號)
                    .HasMaxLength(50)
                    .HasColumnName("b建立者工號");

                entity.Property(e => e.B預計退房時間)
                    .HasColumnType("datetime")
                    .HasColumnName("b預計退房時間");

                entity.Property(e => e.PId).HasColumnName("pId");

                entity.Property(e => e.RbId).HasColumnName("rbId");

                entity.HasOne(d => d.PIdNavigation)
                    .WithMany(p => p.TBeds)
                    .HasForeignKey(d => d.PId)
                    .HasConstraintName("FK_tBed_tPatientInfo");

                entity.HasOne(d => d.RbIdNavigation)
                    .WithMany(p => p.TBeds)
                    .HasForeignKey(d => d.RbId)
                    .HasConstraintName("FK_tBed_tRoombed");
            });

            modelBuilder.Entity<TEmployee>(entity =>
            {
                entity.HasKey(e => e.EId)
                    .HasName("PK_Employee.Shift");

                entity.ToTable("tEmployee");

                entity.Property(e => e.EId).HasColumnName("eId");

                entity.Property(e => e.EEmail)
                    .HasMaxLength(50)
                    .HasColumnName("eEmail");

                entity.Property(e => e.EImagePath)
                    .HasMaxLength(50)
                    .HasColumnName("eImagePath");

                entity.Property(e => e.E修改日期)
                    .HasColumnType("datetime")
                    .HasColumnName("e修改日期");

                entity.Property(e => e.E修改者工號)
                    .HasMaxLength(50)
                    .HasColumnName("e修改者工號");

                entity.Property(e => e.E到職日期)
                    .HasColumnType("datetime")
                    .HasColumnName("e到職日期");

                entity.Property(e => e.E員工姓名)
                    .HasMaxLength(50)
                    .HasColumnName("e員工姓名");

                entity.Property(e => e.E員工生日)
                    .HasColumnType("datetime")
                    .HasColumnName("e員工生日");

                entity.Property(e => e.E員工編號)
                    .HasMaxLength(50)
                    .HasColumnName("e員工編號");

                entity.Property(e => e.E地址)
                    .HasMaxLength(50)
                    .HasColumnName("e地址");

                entity.Property(e => e.E密碼)
                    .HasMaxLength(50)
                    .HasColumnName("e密碼");

                entity.Property(e => e.E建立日期)
                    .HasColumnType("datetime")
                    .HasColumnName("e建立日期");

                entity.Property(e => e.E建立者工號)
                    .HasMaxLength(50)
                    .HasColumnName("e建立者工號");

                entity.Property(e => e.E性別)
                    .HasMaxLength(50)
                    .HasColumnName("e性別");

                entity.Property(e => e.E權限).HasColumnName("e權限");

                entity.Property(e => e.E職稱)
                    .HasMaxLength(50)
                    .HasColumnName("e職稱");

                entity.Property(e => e.E身分證號)
                    .HasMaxLength(50)
                    .HasColumnName("e身分證號");

                entity.Property(e => e.E離職日期)
                    .HasColumnType("datetime")
                    .HasColumnName("e離職日期");

                entity.Property(e => e.E電話)
                    .HasMaxLength(50)
                    .HasColumnName("e電話");
            });

            modelBuilder.Entity<TFamilyMember>(entity =>
            {
                entity.HasKey(e => e.FamId)
                    .HasName("PK_家屬資料表");

                entity.ToTable("tFamilyMembers");

                entity.Property(e => e.FamId).HasColumnName("famId");

                entity.Property(e => e.Fam住址)
                    .HasMaxLength(20)
                    .HasColumnName("fam住址");

                entity.Property(e => e.Fam備註)
                    .HasMaxLength(50)
                    .HasColumnName("fam備註");

                entity.Property(e => e.Fam姓名)
                    .HasMaxLength(10)
                    .HasColumnName("fam姓名");

                entity.Property(e => e.Fam聯絡方式)
                    .HasMaxLength(15)
                    .HasColumnName("fam聯絡方式");

                entity.Property(e => e.PId).HasColumnName("pId");

                entity.HasOne(d => d.PIdNavigation)
                    .WithMany(p => p.TFamilyMembers)
                    .HasForeignKey(d => d.PId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tFamilyMembers_tPatientInfo");
            });

            modelBuilder.Entity<TImage>(entity =>
            {
                entity.HasKey(e => e.MaId);

                entity.ToTable("tImages");

                entity.Property(e => e.MaId).HasColumnName("maId");

                entity.Property(e => e.MeId).HasColumnName("meId");

                entity.Property(e => e.午圖).HasMaxLength(50);

                entity.Property(e => e.圖一).HasMaxLength(50);

                entity.Property(e => e.圖三).HasMaxLength(50);

                entity.Property(e => e.圖二).HasMaxLength(50);

                entity.Property(e => e.早圖).HasMaxLength(50);

                entity.Property(e => e.晚圖).HasMaxLength(50);

                entity.Property(e => e.月圖).HasMaxLength(50);

                entity.HasOne(d => d.Me)
                    .WithMany(p => p.TImages)
                    .HasForeignKey(d => d.MeId)
                    .HasConstraintName("FK_tImages_tMeal");
            });

            modelBuilder.Entity<TMeal>(entity =>
            {
                entity.HasKey(e => e.MeId);

                entity.ToTable("tMeal");

                entity.Property(e => e.MeId).HasColumnName("meId");

                entity.Property(e => e.SuId).HasColumnName("suId");

                entity.Property(e => e.修改時間).HasColumnType("datetime");

                entity.Property(e => e.備註).HasMaxLength(500);

                entity.Property(e => e.價位).HasMaxLength(50);

                entity.Property(e => e.建立人).HasMaxLength(50);

                entity.Property(e => e.建立時間).HasColumnType("datetime");

                entity.Property(e => e.月).HasMaxLength(50);

                entity.Property(e => e.餐別).HasMaxLength(50);

                entity.Property(e => e.餐種).HasMaxLength(50);

                entity.HasOne(d => d.SuIdNavigation)
                    .WithMany(p => p.TMeals)
                    .HasForeignKey(d => d.SuId)
                    .HasConstraintName("FK_tMeal_tSupplier");
            });

            modelBuilder.Entity<TMember>(entity =>
            {
                entity.HasKey(e => e.MId);

                entity.ToTable("tMember");

                entity.Property(e => e.MId).HasColumnName("mId");

                entity.Property(e => e.MEmail)
                    .HasMaxLength(80)
                    .HasColumnName("mEmail");

                entity.Property(e => e.M住址)
                    .HasMaxLength(100)
                    .HasColumnName("m住址");

                entity.Property(e => e.M修改時間)
                    .HasColumnType("datetime")
                    .HasColumnName("m修改時間");

                entity.Property(e => e.M備註)
                    .HasMaxLength(100)
                    .HasColumnName("m備註");

                entity.Property(e => e.M刪除會員).HasColumnName("m刪除會員");

                entity.Property(e => e.M加入時間)
                    .HasColumnType("datetime")
                    .HasColumnName("m加入時間");

                entity.Property(e => e.M姓名)
                    .HasMaxLength(30)
                    .HasColumnName("m姓名");

                entity.Property(e => e.M密碼)
                    .HasMaxLength(50)
                    .HasColumnName("m密碼");

                entity.Property(e => e.M性別).HasColumnName("m性別");

                entity.Property(e => e.M手機)
                    .HasMaxLength(10)
                    .HasColumnName("m手機");

                entity.Property(e => e.M最後登入時間)
                    .HasColumnType("datetime")
                    .HasColumnName("m最後登入時間");

                entity.Property(e => e.M權限)
                    .HasMaxLength(10)
                    .HasColumnName("m權限");

                entity.Property(e => e.M照片)
                    .HasMaxLength(100)
                    .HasColumnName("m照片");
            });

            modelBuilder.Entity<TNursingRecord>(entity =>
            {
                entity.HasKey(e => e.NId)
                    .HasName("PK_nursingRecord");

                entity.ToTable("tNursingRecord");

                entity.Property(e => e.NId).HasColumnName("nId");

                entity.Property(e => e.EId).HasColumnName("eId");

                entity.Property(e => e.N三管)
                    .HasMaxLength(50)
                    .HasColumnName("n三管");

                entity.Property(e => e.N修改時間)
                    .HasMaxLength(50)
                    .HasColumnName("n修改時間");

                entity.Property(e => e.N傷口)
                    .HasMaxLength(200)
                    .HasColumnName("n傷口");

                entity.Property(e => e.N其他)
                    .HasMaxLength(200)
                    .HasColumnName("n其他");

                entity.Property(e => e.N呼吸)
                    .HasMaxLength(50)
                    .HasColumnName("n呼吸");

                entity.Property(e => e.N收縮壓)
                    .HasMaxLength(50)
                    .HasColumnName("n收縮壓");

                entity.Property(e => e.N紀錄時間)
                    .HasMaxLength(50)
                    .HasColumnName("n紀錄時間");

                entity.Property(e => e.N脈搏)
                    .HasMaxLength(50)
                    .HasColumnName("n脈搏");

                entity.Property(e => e.N舒張壓)
                    .HasMaxLength(50)
                    .HasColumnName("n舒張壓");

                entity.Property(e => e.N體溫)
                    .HasMaxLength(50)
                    .HasColumnName("n體溫");

                entity.Property(e => e.OId).HasColumnName("oId");

                entity.Property(e => e.PId).HasColumnName("pId");

                entity.HasOne(d => d.EIdNavigation)
                    .WithMany(p => p.TNursingRecords)
                    .HasForeignKey(d => d.EId)
                    .HasConstraintName("FK_tNursingRecord_tEmployee");

                entity.HasOne(d => d.OIdNavigation)
                    .WithMany(p => p.TNursingRecords)
                    .HasForeignKey(d => d.OId)
                    .HasConstraintName("FK_tNursingRecord_tOffService");

                entity.HasOne(d => d.PIdNavigation)
                    .WithMany(p => p.TNursingRecords)
                    .HasForeignKey(d => d.PId)
                    .HasConstraintName("FK_tNursingRecord_tPatientInfo");
            });

            modelBuilder.Entity<TOffService>(entity =>
            {
                entity.HasKey(e => e.OId)
                    .HasName("PK_offService");

                entity.ToTable("tOffService");

                entity.Property(e => e.OId).HasColumnName("oId");

                entity.Property(e => e.EId).HasColumnName("eId");

                entity.Property(e => e.O回診日期)
                    .HasMaxLength(50)
                    .HasColumnName("o回診日期");

                entity.Property(e => e.O就診日期)
                    .HasMaxLength(50)
                    .HasColumnName("o就診日期");

                entity.Property(e => e.O建立)
                    .HasColumnType("smalldatetime")
                    .HasColumnName("o建立");

                entity.Property(e => e.O指示與用藥)
                    .HasMaxLength(200)
                    .HasColumnName("o指示與用藥");

                entity.Property(e => e.O更新)
                    .HasColumnType("smalldatetime")
                    .HasColumnName("o更新");

                entity.Property(e => e.O醫師診斷)
                    .HasMaxLength(500)
                    .HasColumnName("o醫師診斷");

                entity.Property(e => e.PId).HasColumnName("pId");

                entity.HasOne(d => d.EIdNavigation)
                    .WithMany(p => p.TOffServices)
                    .HasForeignKey(d => d.EId)
                    .HasConstraintName("FK_tOffService_tEmployee");

                entity.HasOne(d => d.PIdNavigation)
                    .WithMany(p => p.TOffServices)
                    .HasForeignKey(d => d.PId)
                    .HasConstraintName("FK_tOffService_tPatientInfo");
            });

            modelBuilder.Entity<TOrder>(entity =>
            {
                entity.HasKey(e => e.M進貨編號);

                entity.ToTable("tOrder");

                entity.Property(e => e.M進貨編號).HasColumnName("m進貨編號");

                entity.Property(e => e.EId).HasColumnName("eId");

                entity.Property(e => e.M價錢)
                    .HasColumnType("money")
                    .HasColumnName("m價錢");

                entity.Property(e => e.M到貨日期)
                    .HasColumnType("datetime")
                    .HasColumnName("m到貨日期");

                entity.Property(e => e.M小計)
                    .HasColumnType("money")
                    .HasColumnName("m小計");

                entity.Property(e => e.M庫存數量).HasColumnName("m庫存數量");

                entity.Property(e => e.M衛材編號).HasColumnName("m衛材編號");

                entity.Property(e => e.M訂購數量).HasColumnName("m訂購數量");

                entity.Property(e => e.M訂購日期)
                    .HasColumnType("datetime")
                    .HasColumnName("m訂購日期");

                entity.Property(e => e.M訂購狀態).HasColumnName("m訂購狀態");

                entity.HasOne(d => d.EIdNavigation)
                    .WithMany(p => p.TOrders)
                    .HasForeignKey(d => d.EId)
                    .HasConstraintName("FK_tOrder_tEmployee");

                entity.HasOne(d => d.M衛材編號Navigation)
                    .WithMany(p => p.TOrders)
                    .HasForeignKey(d => d.M衛材編號)
                    .HasConstraintName("FK_tOrder_tProduct");
            });

            modelBuilder.Entity<TOrderMeal>(entity =>
            {
                entity.HasKey(e => e.OmId);

                entity.ToTable("tOrderMeal");

                entity.Property(e => e.OmId).HasColumnName("omId");

                entity.Property(e => e.MeId).HasColumnName("meId");

                entity.Property(e => e.修改人員)
                    .HasMaxLength(10)
                    .IsFixedLength();

                entity.Property(e => e.修改時間).HasColumnType("datetime");

                entity.Property(e => e.備註).HasMaxLength(500);

                entity.Property(e => e.建立時間).HasColumnType("datetime");

                entity.Property(e => e.結帳狀態).HasMaxLength(50);

                entity.Property(e => e.總價).HasMaxLength(50);

                entity.Property(e => e.訂購人).HasMaxLength(50);

                entity.Property(e => e.訂購人電話).HasMaxLength(50);

                entity.Property(e => e.訂餐結束日).HasColumnType("datetime");

                entity.Property(e => e.訂餐起始日).HasColumnType("datetime");

                entity.HasOne(d => d.Me)
                    .WithMany(p => p.TOrderMeals)
                    .HasForeignKey(d => d.MeId)
                    .HasConstraintName("FK_tOrderMeal_tMeal");
            });

            modelBuilder.Entity<TPatientInfo>(entity =>
            {
                entity.HasKey(e => e.PId)
                    .HasName("PK_patientInfo");

                entity.ToTable("tPatientInfo");

                entity.Property(e => e.PId).HasColumnName("pId");

                entity.Property(e => e.EId).HasColumnName("eId");

                entity.Property(e => e.P主訴)
                    .HasMaxLength(500)
                    .HasColumnName("p主訴");

                entity.Property(e => e.P出生日期)
                    .HasMaxLength(50)
                    .HasColumnName("p出生日期");

                entity.Property(e => e.P地址)
                    .HasMaxLength(80)
                    .HasColumnName("p地址");

                entity.Property(e => e.P姓名)
                    .HasMaxLength(50)
                    .HasColumnName("p姓名");

                entity.Property(e => e.P建立)
                    .HasColumnType("smalldatetime")
                    .HasColumnName("p建立");

                entity.Property(e => e.P性別)
                    .HasMaxLength(50)
                    .HasColumnName("p性別");

                entity.Property(e => e.P更新)
                    .HasColumnType("smalldatetime")
                    .HasColumnName("p更新");

                entity.Property(e => e.P照片)
                    .HasMaxLength(50)
                    .HasColumnName("p照片");

                entity.Property(e => e.P編號)
                    .HasMaxLength(50)
                    .HasColumnName("p編號");

                entity.Property(e => e.P聯絡人)
                    .HasMaxLength(50)
                    .HasColumnName("p聯絡人");

                entity.Property(e => e.P聯絡電話)
                    .HasMaxLength(15)
                    .IsUnicode(false)
                    .HasColumnName("p聯絡電話");

                entity.Property(e => e.P身分證字號)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("p身分證字號");

                entity.Property(e => e.P醫師診斷)
                    .HasMaxLength(500)
                    .HasColumnName("p醫師診斷");

                entity.Property(e => e.P電話2)
                    .HasMaxLength(15)
                    .IsUnicode(false)
                    .HasColumnName("p電話2");

                entity.Property(e => e.P餐點)
                    .HasMaxLength(50)
                    .HasColumnName("p餐點");

                entity.Property(e => e.家族病史).HasMaxLength(500);

                entity.Property(e => e.指示與用藥).HasMaxLength(500);

                entity.Property(e => e.檢查).HasMaxLength(500);

                entity.Property(e => e.現在病史).HasMaxLength(500);

                entity.Property(e => e.過去病史).HasMaxLength(500);

                entity.HasOne(d => d.EIdNavigation)
                    .WithMany(p => p.TPatientInfos)
                    .HasForeignKey(d => d.EId)
                    .HasConstraintName("FK_tPatientInfo_tEmployee");
            });

            modelBuilder.Entity<TProduct>(entity =>
            {
                entity.HasKey(e => e.M衛材編號);

                entity.ToTable("tProduct");

                entity.Property(e => e.M衛材編號).HasColumnName("m衛材編號");

                entity.Property(e => e.M單位)
                    .HasMaxLength(10)
                    .HasColumnName("m單位");

                entity.Property(e => e.M單價)
                    .HasColumnType("money")
                    .HasColumnName("m單價");

                entity.Property(e => e.M安全庫存數).HasColumnName("m安全庫存數");

                entity.Property(e => e.M庫存數量).HasColumnName("m庫存數量");

                entity.Property(e => e.M衛材名稱)
                    .HasMaxLength(100)
                    .HasColumnName("m衛材名稱");

                entity.Property(e => e.M訂購狀態).HasColumnName("m訂購狀態");
            });

            modelBuilder.Entity<TRoombed>(entity =>
            {
                entity.HasKey(e => e.RbId)
                    .HasName("PK_tRoom");

                entity.ToTable("tRoombed");

                entity.Property(e => e.RbId).HasColumnName("rbId");

                entity.Property(e => e.Rb修改日期)
                    .HasColumnType("datetime")
                    .HasColumnName("rb修改日期");

                entity.Property(e => e.Rb修改者工號)
                    .HasMaxLength(50)
                    .HasColumnName("rb修改者工號");

                entity.Property(e => e.Rb床號)
                    .HasMaxLength(50)
                    .HasColumnName("rb床號");

                entity.Property(e => e.Rb建立日期)
                    .HasColumnType("datetime")
                    .HasColumnName("rb建立日期");

                entity.Property(e => e.Rb建立者工號)
                    .HasMaxLength(50)
                    .HasColumnName("rb建立者工號");

                entity.Property(e => e.Rb房型)
                    .HasMaxLength(50)
                    .HasColumnName("rb房型");

                entity.Property(e => e.Rb空床)
                    .HasMaxLength(50)
                    .HasColumnName("rb空床");
            });

            modelBuilder.Entity<TShift>(entity =>
            {
                entity.HasKey(e => e.SId);

                entity.ToTable("tShift");

                entity.Property(e => e.SId).HasColumnName("sId");

                entity.Property(e => e.EId).HasColumnName("eId");

                entity.Property(e => e.S中班)
                    .HasMaxLength(50)
                    .HasColumnName("s中班");

                entity.Property(e => e.S休假)
                    .HasMaxLength(50)
                    .HasColumnName("s休假");

                entity.Property(e => e.S備註)
                    .HasMaxLength(50)
                    .HasColumnName("s備註");

                entity.Property(e => e.S日期)
                    .HasColumnType("datetime")
                    .HasColumnName("s日期");

                entity.Property(e => e.S早班)
                    .HasMaxLength(50)
                    .HasColumnName("s早班");

                entity.Property(e => e.S晚班)
                    .HasMaxLength(50)
                    .HasColumnName("s晚班");

                entity.HasOne(d => d.EIdNavigation)
                    .WithMany(p => p.TShifts)
                    .HasForeignKey(d => d.EId)
                    .HasConstraintName("FK_tShift_tEmployee");
            });

            modelBuilder.Entity<TSupplier>(entity =>
            {
                entity.HasKey(e => e.SuId);

                entity.ToTable("tSupplier");

                entity.Property(e => e.SuId).HasColumnName("suId");

                entity.Property(e => e.修改時間).HasColumnType("datetime");

                entity.Property(e => e.備註).HasMaxLength(50);

                entity.Property(e => e.廠商email).HasMaxLength(50);

                entity.Property(e => e.廠商名稱).HasMaxLength(50);

                entity.Property(e => e.廠商地址).HasMaxLength(50);

                entity.Property(e => e.廠商聯絡人).HasMaxLength(50);

                entity.Property(e => e.廠商電話).HasMaxLength(50);

                entity.Property(e => e.建立人).HasMaxLength(50);

                entity.Property(e => e.建立時間).HasColumnType("datetime");

                entity.Property(e => e.聯絡人email).HasMaxLength(50);
            });

            modelBuilder.Entity<TTake>(entity =>
            {
                entity.HasKey(e => e.M領取編號);

                entity.ToTable("tTake");

                entity.Property(e => e.M領取編號).HasColumnName("m領取編號");

                entity.Property(e => e.EId).HasColumnName("eId");

                entity.Property(e => e.M庫存數量).HasColumnName("m庫存數量");

                entity.Property(e => e.M用途)
                    .HasMaxLength(100)
                    .HasColumnName("m用途");

                entity.Property(e => e.M衛材編號).HasColumnName("m衛材編號");

                entity.Property(e => e.M領取數量).HasColumnName("m領取數量");

                entity.Property(e => e.M領取時間)
                    .HasColumnType("datetime")
                    .HasColumnName("m領取時間");

                entity.HasOne(d => d.EIdNavigation)
                    .WithMany(p => p.TTakes)
                    .HasForeignKey(d => d.EId)
                    .HasConstraintName("FK_tTake_tEmployee");

                entity.HasOne(d => d.M衛材編號Navigation)
                    .WithMany(p => p.TTakes)
                    .HasForeignKey(d => d.M衛材編號)
                    .HasConstraintName("FK_tTake_tProduct");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
