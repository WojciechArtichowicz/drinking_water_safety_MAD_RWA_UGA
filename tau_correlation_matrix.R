library(NADA)

tau <- function(data.df){
  cn <- colnames(data.df)
  LOQ.cn <- str_match(cn,".LOQ")  
  cn.val <- cn[is.na(LOQ.cn)]  # columns with values
  cn.LOQ <- cn[!is.na(LOQ.cn)]  # columns with LOQ flags
    
  loq.col.n <- length(cn.LOQ) # number of LOQ columns  
  n <- length(cn.val)
  
  T <- matrix(nrow = n,ncol=n)
  colnames(T) <- cn.val
  rownames(T) <- cn.val 
    
  pv <- matrix(nrow = n,ncol=n)
  colnames(pv) <- cn.val
  rownames(pv) <- cn.val     
  
  ix <- 0  
  for (cx in cn.val) {
     # print(cx)
    ix <- ix + 1  
    cx.LOQ <- paste0(cx,".LOQ")    
    x <- data.df[[cx]]
    x.LOQ <-  data.df[[cx.LOQ]]
    
    iy <- 0  
    for (cy in cn.val) {         
        #print(paste0("   ",cy))
        iy <- iy + 1
        cy.LOQ <- paste0(cy,".LOQ")    
        y <- data.df[[cy]]
        y.LOQ <-  data.df[[cy.LOQ]]  
        
        final.df <- na.omit(data.frame(x,x.LOQ, y,y.LOQ))
        fnrow <- nrow(final.df)
        
        if (fnrow==0) {
          next
        }
        
        #print(paste(cx, cy, fnrow,sum(final.df$x.LOQ),sum(final.df$y.LOQ)))        
        if (sum(final.df$x.LOQ)==0 & sum(final.df$y.LOQ)==0){ 
            # find ordinary Kendall tau
            #print(paste(cx,cy))
             tau.res <- cor.test(final.df$x,final.df$y, method="kendall") 
    
            T[ix,iy] <- tau.res$estimate
            T[iy,ix] <- tau.res$estimate
        
            pv[ix,iy] <- tau.res$p.value 
            pv[iy,ix] <- tau.res$p.value             
            
        } else {
            tryCatch({ tau.res <- cenken(final.df$y, final.df$y.LOQ, final.df$x, final.df$x.LOQ) },
                             error=function(e) {
                            # message('Could not determine tau')
                            # print(e)
                             tau.res$tau <- NA  
                             tau.res$p <- NA    
                           })
        
           T[ix,iy] <- tau.res$tau
           T[iy,ix] <- tau.res$tau
        
           pv[ix,iy] <- tau.res$p
           pv[iy,ix] <- tau.res$p         
        }       
    }      
  }
 
  return(list("tau"=T,"p"=pv))
}