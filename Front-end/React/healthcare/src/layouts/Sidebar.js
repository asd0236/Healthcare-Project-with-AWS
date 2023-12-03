import { Button, Nav, NavItem } from "reactstrap";
import Logo from "./Logo";
import { Link, useLocation } from "react-router-dom";

const navigation = [
  {
    title: "대시보드",
    href: "/starter",
    icon: "bi bi-speedometer2",
  },
  {
    title: "알림",
    href: "/alerts",
    icon: "bi bi-bell",
  },
  {
    title: "배지",
    href: "/badges",
    icon: "bi bi-patch-check",
  },
  {
    title: "버튼",
    href: "/buttons",
    icon: "bi bi-hdd-stack",
  },
  {
    title: "카드",
    href: "/cards",
    icon: "bi bi-card-text",
  },
  {
    title: "그리드",
    href: "/grid",
    icon: "bi bi-columns",
  },
  {
    title: "팀 테이블",
    href: "/table",
    icon: "bi bi-layout-split",
  },
  {
    title: "폼 작성",
    href: "/forms",
    icon: "bi bi-textarea-resize",
  },
  {
    title: "브레드크럼",
    href: "/breadcrumbs",
    icon: "bi bi-link",
  },
  {
    title: "About",
    href: "/about",
    icon: "bi bi-people",
  },
];

const Sidebar = () => {
  const showMobilemenu = () => {
    document.getElementById("sidebarArea").classList.toggle("showSidebar");
  };
  let location = useLocation();

  return (
    <div className="p-3">
      <div className="d-flex align-items-center">
        <Logo />
        <span className="ms-auto d-lg-none">
          <Button
            close
            size="sm"
            className="ms-auto d-lg-none"
            onClick={() => showMobilemenu()}
          ></Button>
        </span>
      </div>
      <div className="pt-4 mt-2">
        <Nav vertical className="sidebarNav">
          {navigation.map((navi, index) => (
            <NavItem key={index} className="sidenav-bg">
              <Link
                to={navi.href}
                className={
                  location.pathname === navi.href
                    ? "text-primary nav-link py-3"
                    : "nav-link text-secondary py-3"
                }
              >
                <i className={navi.icon}></i>
                <span className="ms-3 d-inline-block">{navi.title}</span>
              </Link>
            </NavItem>
          ))}
        </Nav>
      </div>
    </div>
  );
};

export default Sidebar;
