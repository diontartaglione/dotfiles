return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local logo = [[
	   dBBBBBb  dBP dBBBBBb     dBBBBb  dBBBP dBBBBBBP dBBBP 
	       dB'           BB        dBP                       
	   dBBBP' dBP    dBP BB   dBP dBP dBBP     dBP   dBBP    
	  dBP    dBP    dBP  BB  dBP dBP dBP      dBP   dBP      
	 dBP    dBBBBP dBBBBBBB dBP dBP dBBBBP   dBP   dBBBBP
	
	                     @planete
	]]

    opts.section.header.val = vim.split(logo, "\n", { trimempty = true })
  end,
}
