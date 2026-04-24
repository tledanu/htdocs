<nav class="navbar">
    <div class="nav-container">
        <a href="/internship_project/index.php" class="nav-logo">SWU Internship</a>
        
        <ul class="nav-menu">
            <li><a href="/internship_project/index.php">หน้าแรก</a></li>
            <li><a href="/internship_project/showcase.php">Showcase</a></li>
            
            <li class="dropdown">
                <a href="javascript:void(0)" class="dropbtn">ข้อมูลนิสิต</a>
                <div class="dropdown-content">
                    <a href="/internship_project/std1.php">นิสิตชั้นปีที่ 1</a>
                    <a href="/internship_project/std2.php">นิสิตชั้นปีที่ 2</a>
                    <a href="/internship_project/std3.php">นิสิตชั้นปีที่ 3</a>
                    <a href="/internship_project/std4.php">นิสิตชั้นปีที่ 4</a>
                </div>
            </li>
            
            <li><a href="/internship_project/teach.php">ข้อมูลอาจารย์</a></li>

            <?php if(isset($_SESSION['user_id'])): ?>
                <li class="user-display">
                    <span><?php echo $_SESSION['name'];?></span>
                </li>
                <li><a href="/internship_project/logout.php" class="login-link logout-style">ออกจากระบบ</a></li>
            <?php else: ?>
                <li><a href="/internship_project/login.php" class="login-link">เข้าสู่ระบบ</a></li>
            <?php endif; ?>
        </ul>
    </div>
</nav>