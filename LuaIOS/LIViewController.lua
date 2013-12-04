waxClass{"LIViewController", UITableViewController}

function viewDidLoad(self)
    print("viewDidLoad")
end

function tableView_numberOfRowsInSection(self, tableView, section) 
    return 20;
end 

function tableView_cellForRowAtIndexPath(self, tableView, indexPath)
	local cell = self:ORIGtableView_cellForRowAtIndexPath(tableView, indexPath)
	cell:textLabel():setText("" .. indexPath:row())
	cell:detailTextLabel():setText("TEST DATA LUA  HUHUHU~~~")
	cell:textLabel():setTextColor(UIColor:redColor())
    print("cell num is :" .. indexPath:row())
    --if (1 == indexPath:row()) then
        --print("OMG---------!!!!!!!")
    --end
	return cell
end

function tableView_didDeselectRowAtIndexPath(self, tableView, indexPath)
     print("you selected row num is : "..indexPath:row())
end